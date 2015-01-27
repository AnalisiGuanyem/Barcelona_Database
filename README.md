# Barcelona_Database

## Presentation

This **Barcelona Database** tries to compile and organize data from the city of Barcelona.

The origin of the data would be:

1. already available data from public repositories, 
2. data from third parties that was not yet available and 
3. new data that we can generate with analyses, surveis, etc.

Some of the websites depending on the public administrations that provide (or *should provide!*) data about Barcelona and following the principles of the Open Data could be:

* [Open Data del Ajuntament de Barcelona](http://opendata.bcn.cat)
* [Departament d'Estadística](http://www.bcn.cat/estadistica/catala/index.htm)
* [Servei CartoBCN](http://w20.bcn.cat/cartobcn/)
* [Servei GeoPortal BCN](http://www.bcn.cat/geoportal/ca/presentacio.html)
* [Arxius Municipals](http://w110.bcn.cat/portal/site/ArxiuMunicipal)
* [Biblioteca General](http://w110.bcn.cat/portal/site/BibliotecaGeneral)
* [Seu electrónica](http://w110.bcn.cat/portal/site/Ajuntament)
* [Transports Metropolitans de Barcelona (TMB)](http://www.tmb.cat/es/tmb-open-data)
* [Àrea Metropolitana de Barcelona (AMB)](http://www.amb.cat/s/web/area-metropolitana/dades-estadistiques.html)
* [Diputació de Barcelona (DIBA)](http://dadesobertes.diba.cat/datasets?f[0]=field_keyword%3Abarcelona)
* [Generalitat de Catalunya](http://dadesobertes.gencat.cat/ca/cercador/cerca-cataleg?q=barcelona)
* [Instituto Nacional de Estadística](http://www.ine.es/buscar/searchResults.do?searchString=barcelona)

It is important to remark that **we do not try to replace the function of official public open data repositories**. With this repository, we just try to overcome punctual problems on formats, dispersions, lacks and difficulties to find specfic data that could be useful for further integrated analyses and visualizations. Then, the main goal of the *Barcelona Database* is to facilitate the production of studies, applications, tools and/or manuals helping to understand Barcelona.

Publishing these data in an open format and allowing/promoting a non-restrictive community use is also important for us. We want to facilitate and strongly encourage the reuse of data beyond the *Anàlisi de Dades* group and the **[Guanyem Barcelona](http://guanyembarcelona.cat)** context. In addition to the natural association between *new uses* and *creation of new value*, promoting and educating in the open use of data is an important part of the collective and citizen empowerment that is going on.

## Tables

### Info_per_barris

Neighborhood disaggregated data.

The registered neighborhoods are:

1. el Raval
2. el Barri Gotic
3. la Barceloneta
4. Sant Pere, Santa Caterina i la Ribera
5. el Fort Pienc
6. la Sagrada Familia
7. la Dreta de l'Eixample
8. l'Antiga Esquerra de l'Eixample
9. la Nova Esquerra de l'Eixample
10. Sant Antoni
11. el Poble Sec 
12. la Marina del Prat Vermell 
13. la Marina de Port
14. la Font de la Guatlla
15. Hostafrancs
16. la Bordeta
17. Sants-Badal
18. Sants
19. les Corts
20. la Maternitat i Sant Ramon
21. Pedralbes
22. Vallvidrera, el Tibidabo i les Planes
23. Sarrià
24. les Tres Torres
25. Sant Gervasi 
26. Sant Gervasi 
27. el Putxet i el Farro
28. Vallcarca i els Penitents
29. el Coll
30. la Salut
31. la Vila de Gracia
32. el Camp d'en Grassot i Gracia Nova
33. el Baix Guinardo
34. Can Baro
35. el Guinardo
36. la Font d'en Fargues
37. el Carmel
38. la Teixonera
39. Sant Genis dels Agudells
40. Montbau
41. la Vall d'Hebron
42. la Clota
43. Horta
44. Vilapicina i la Torre Llobeta
45. Porta
46. el Turo de la Peira
47. Can Peguera
48. la Guineueta
49. Canyelles
50. les Roquetes
51. Verdun
52. la Prosperitat
53. la Trinitat Nova
54. Torre Baro
55. Ciutat Meridiana
56. Vallbona
57. la Trinitat Vella
58. Baro de Viver
59. el Bon Pastor
60. Sant Andreu
61. la Sagrera
62. el Congres i els Indians
63. Navas
64. el Camp de l'Arpa del Clot
65. el Clot
66. el Parc i la Llacuna del Poblenou
67. la Vila Olimpica del Poblenou
68. el Poblenou
69. Diagonal Mar i el Front Maritim del Poblenou
70. el Besos i el Maresme
71. Provencals del Poblenou
72. Sant Marti de Provencals
73. la Verneda i la Pau

The 10 districts containing these neighborhoods are:

1. Ciutat Vella
2. Eixample
3. Sants-Montjuïc
4. Les Corts
5. Sarrià - Sant Gervasi
6. Gràcia
7. Horta-Guinardó
8. Nou Barris
9. Sant Andreu
10. Sant Martí

New variables to be added to the *info_per_barris* table need to strictly follow the same order than here.

Information about the variables registered is available in the *metadata* file of the *info_per_barris* folder.

## Cautions!

All data added to our *Barcelona Database* must be semicolon (;) separated. The decimal mark must be a point (.). Special symbols in names or values should be avoided. And, please, do not transform or scale the original values (it is better to keep raw data as it was in origin).


