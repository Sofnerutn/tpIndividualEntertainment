# ## Conceptos de Paradigmas utilizados:

1. **Polimorfismo:** Ya que el código permite que diferentes objetos (bandas) respondan a los mismos mensajes (como popularidad() o gastoExtra()) con su propia lógica interna.
2. **Listas:** Para la parte final donde empecé a usar map(), sum() para justamente ir filtrando información
3. **Colecciones:** Usé colecciones para las entradas ya que no me importaba el orden y consideré que no había entradas repetidas todas las entradas en sí son distintas, obvio pueden ser de la misma banda para el mismo show pero consideré que la entrada en sí todas tienen un id distinto.
4. **Herencia:** Mecanismo mediante el cual una clase (como `BandaDeRock`) hereda estado y comportamiento de una clase superior (`Banda`), evitando la duplicación de código ya que puede haber varias bandas de rock o de trap pero no dejan de ser BANDAS y de no haber usado herencia hubiese repetido lógica
5. **Encapsulamiento:** Cada objeto maneja y protege su propio estado interno (como el dinero del asistente o el canon de la banda), exponiendo solo lo necesario a través de métodos.
