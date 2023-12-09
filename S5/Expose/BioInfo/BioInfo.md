# Base

Cellules → Noyaux de cellules → Chromosome → ADN → Nucléotides (ATCG)

## Définitions

- **Cellule :** Unité constitutive de base du vivant.
- **ADN :** (Acide DésoxyriboNucléique) Support de l'information génétique. L'ADN est une longue chaîne de nucléotides.
- **ARNm :** Traduction de l'ADN où la thymine (T) est remplacée par l'uracile (U), donc ATCG → ACGU.
- **Dogme central de la biologie moléculaire :** Production des protéines à partir de l’ADN (via l’ARN).
- **Code génétique :** Code de la traduction de l’ADN en protéine.
- **Gène :** Séquence spécifique d'ADN qui contient l'information nécessaire pour la synthèse d'une protéine.

## Focus ADN

- **ADN :** 4 lettres ATCG.
- On lit l’ADN par codons (triplets de nucléotides).
- Donc 4³ = 64 codons possibles.
- 20 protéines différentes pour 64 codons, donc plusieurs codons codent la même protéine : le code génétique est redondant.
- L’OpenReadingFrame est une suite de codons qui commence par un codon Start (ATG → M) et finit par un codon Stop (TGG/TAG/TGA) qui ne code pas de protéine, il indique simplement la fin.

## Evolution génétique

- [Vidéo sur l'évolution génétique](https://www.youtube.com/watch?v=F9NPnKZkF-Y)
- L’évolution des gènes laisse des traces visibles.
- Évolution des gènes = substitutions, insertions, délétions.
- Les gènes des organismes modernes sont issus de remaniements de gènes ancestraux : on peut déduire leur fonction par comparaison avec les gènes homologues d’autres espèces.
- Il existe des gènes universels.
- Homologie = parenté = ancêtre commun.

Pour tenter de trouver une Homologie on doit résoudre 3 problèmes :
1. **Assemblage :** Comment obtenir les séquences d’ADN ?
2. **Alignement :** Comment comparer ces séquences ?
3. **Phylogénie :** Comment reconstruire les relations de parentés ?

### 1. Assemblage

- Récupération d’un échantillon de l’espèce.
- Séquençage par une machine (amplification, casse aléatoire, traduction).
- En sortie, des millions de petits morceaux de génomes (ATCG) : les reads.
- On essaye de recréer la chaîne la plus courte possible, une chaîne qui contient tous les reads (Problème informatique : “Plus courte super-chaîne commune”), c’est la Formalisation.

### 2. Alignement

- L’alignement de séquences est la principale méthode de comparaison.
- Comparer des séquences serait relativement simple si elles avaient toutes la même longueur.
- On cherche donc à les aligner (cf distance d’edition).

En fonction des coûts choisis pour chaque opération et de l’Algorithme, le résultat peut varier.

### 3. Phylogénie

- Un arbre phylogénétique est une sorte d’arbre de parenté des espèces qui peut prendre différentes formes et cherche à repérer les séparations entre familles d'êtres vivants dans l’évolution.
- Il n’y a pas un arbre universel, tout dépend des traits/caractéristiques étudiés (ex. : Phylogénie moléculaire vs caractères morphologiques).
- Plusieurs méthodes de reconstruction existent : parcimonie, distances, Maximum de Vraisemblance, Bayésiennes.
- Unweight Pair Group Method with Arithmetic Mean (UPGMA) est un algorithme qui passe de la matrice du vivant à l’arbre.

## Dates Historiques

- 1736 : Naissance de la théorie des graphes, Leonhard Euler.
- 1842 : Premier programme informatique, Ada Lovelace.
- 1859 : L’origine des espèces, Charles Darwin.
- 1953 : Découverte de la structure de l’ADN, Rosalind Franklin (co-découvreuse).
- 1961 : Découverte du code génétique.
- 1967 : "Construction of Phylogenetic Trees", Fitch & Margoliash.
- 1968 : Atlas of Protein Sequences, M. Dayhoff.
- 1970 : Alignement de séquences (Needleman & Wunsch) puis en 1981 alignement local (Smith & Waterman).
- 1977 : Méthode de séquençage Sanger.
- ∼ 1980 : Bases de données : EMBL, GenBank, PIR.
- 1985-88 : Programmes "Fasta" (Pearson-Lipman) & 1990 "Blast" (Altschul et al.) pour rechercher des séquences dans les banques.
- 1990 : Ouverture du WorldWide Web.
- 1994 : ClustalW, logiciel d’alignement multiple.
- 1995 : 1er génome complet d’un organisme vivant (Haemophilus influenzae).
- 1996 : Génome de la levure.
- 1990 → 2003 : Projet génome humain.
- 2003 → aujourd’hui : Projet ENCODE.
- 2008 → aujourd’hui : Projet 1000 génomes.

## Le Master-BioInfo

- Enseigné depuis 2001 à UM mais nouvelle formule depuis 2021.
- S1 adapté à faire le pont entre les Bio et les Infos.
- S2-S3 : montée en puissance vers le cœur de métier et UE professionnalisantes.
- Nombreux stages et projets, Apprentissage par projet ⇒ compétences par la pratique :
  - S1, S3 : Projet bibliographique.
  - S2 : Stage court (3 mois).
  - S4 : Stage long (6 mois).
