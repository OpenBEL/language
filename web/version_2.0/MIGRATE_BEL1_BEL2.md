# Migrate BEL 1.0 to BEL 2.0

## Fusions

### BEL 1.0
The abundances of fusion entities resulting from chromosomal translocation mutations can be specified by using the fusion() or fus() function within a protein abundance term. For example:

    r(HGNC:BCR, fus(HGNC:JAK2, 1875, 2626))

This term represents the abundance of a fusion mRNA of the 5' partner BCR and 3' partner JAK2, with the breakpoint for BCR at 1875 and JAK2 at 2626. If the breakpoint is not specified, the fusion protein abundance can be represented as:

    p(HGNC:BCR, fus(HGNC:JAK2))

### BEL 2.0

mRNA abundance of fusion with known breakpoints (can be used for g() and p() as well)

    r(fus(HGNC:BCR, r.1\_1875, HGNC:JAK2, r.2626\_5034))

The **r.** designation in the range fields indicates that the numbering uses the RNA sequence as the reference. You use **c.** for g() fusions and **p.** for p() fusions. Gene and RNA sequence numbering starts at the transcription initiation site.

RNA abundance of fusion with unspecified breakpoints

    r(fus(HGNC:TMPRSS2, ?, HGNC:ERG, ?))


## Variations

### BEL 1.0

    proteinAbundance(HGNC:ABCA1, truncation(1851))
    p(HGNC:ABCA1, trunc(1851))


    proteinAbundance(HGNC:PIK3CA, substitution(E, 545, K))
    p(HGNC:PIK3CA, sub(E, 545, K))


### BEL 2.0

    p(HGNC:CFTR, var(p.Gly576Ala))  # substitution using 3 or 1 letter amino acid code, *=stop codon
    p(HGNC:CFTR, var(p.C65* ))  # truncation at residue 65
    r(HGNC:CFTR), var(r.243a>u)  # [a, g, c, u]
    g(HGNC:CFTR), var(c.243A>T)  # [A, G, C, T]  (g.* prefix is for genomic sequence)


## Protein Modifications

Convert modtype (e.g. pmod(modtype, residue, location) ) from BEL 1.0 to BEL 2.0

    modtype = {'P': 'Ph', 'A': 'Ac', 'F': 'Farn', 'G': 'Glyco', 'H': 'Hy', 'M': 'Me', 'R': 'ADPRib', 'S': 'Sumo', 'U': 'Ub'}

 BEL1: p(HGNC:MAPK1, pmod(P, Thr, 185))  --> BEL2:  p(HGNC:MAPK1, pmod(Ph, Thr, 185))

## Translocations

Just need to add fromLoc() and toLoc() to BEL 1.0 to convert to BEL 2.0

### BEL 1.0

    tloc(p(HGNC:EGFR), MESHCL:Cytoplasm, MESHCL:"Cell Nucleus")

### BEL 2.0

    tloc(p(HGNC:EGFR), fromLoc(MESHCL:Cytoplasm), toLoc(MESHCL:"Cell Nucleus"))

## Activity functions

All activity functions need to be copied from the <activityfunction>(target) format to act(target, ma(<activityfunction>)) format.

    ACTIVITIES = {
        'cat'=>'cat', 'catalyticActivity'=>'cat', 'chap'=>'chap', 'chaperoneActivity'=>'chap',
        'gtp'=>'gtp', 'gtpBoundActivity'=>'gtp', 'kin' => 'kin', 'kinaseActivity' => 'kin',
        'act'=>'act', 'molecularActivity'=>'act', 'pep'=>'pep', 'peptidaseActivity'=>'pep',
        'phos'=>'phos', 'phosphataseActivity'=>'phos', 'ribo'=>'ribo', 'ribosylationActivity'=>'ribo',
        'tscript'=>'tscript', 'transcriptionalActivity'=>'tscript', 'tport'=>'tport', 'transportActivity'=>'tport',
    }

### BEL 1.0

    cat(p(RGD:Sod1))

### BEL 2.0

    act(p(RGD:Sod1), ma(cat))
