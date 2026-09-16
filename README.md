# ABAP Training

Repositorio de ejercicios de **ABAP para SAP BTP ABAP Cloud**. El contenido esta organizado como pequenas lecciones independientes: cada clase publica implementa `IF_OO_ADT_CLASSRUN~MAIN`, por lo que puede ejecutarse desde ADT (Eclipse) como una aplicacion de consola y escribir resultados mediante `out->write( )`.

Los ejemplos estan pensados para estudiar la sintaxis y el modelo de objetos de ABAP. Algunas instrucciones `out->write( )` estan comentadas deliberadamente para poder activar cada ejercicio paso a paso.

## Estructura

```text
abap_training/
|-- README.md
`-- src/
	|-- package.devc.xml
	|-- zcl_*.clas.abap       Clases de las lecciones
	|-- z_if_add_55.intf.abap Interfaz OO
	|-- zfunc_group_55.*       Grupo y modulos de funciones
	`-- ztb_db_lesson_55.tabl.xml Tabla DDIC para Open SQL
```

Los archivos `.xml` son metadatos serializados por **abapGit**. Los archivos `.abap` contienen el codigo fuente.

## Conceptos cubiertos

### 1. Programa ABAP y tipos de datos

`zcl_types_55` presenta la declaracion de objetos de datos con `DATA`, inferencia con `DATA(variable) = ...` y tipos locales con `TYPES`:

- `c` para texto de longitud fija, `string` para texto de longitud variable y `n` para texto numerico.
- `i` para enteros, `f` para coma flotante y `p` para numeros empaquetados con `LENGTH` y `DECIMALS`.
- `d` para fechas y `t` para horas.
- Estructuras declaradas con `TYPES: BEGIN OF ... END OF` y acceso a componentes con `estructura-campo`.
- Valores iniciales y constantes de declaracion mediante `VALUE`.
- Comentarios con `*` al inicio de linea y con comillas dobles al final de una instruccion.
- Literales de texto con comillas simples y plantillas de texto con backticks o `|...|`.

Las plantillas permiten interpolacion, por ejemplo `|Hola { nombre }|`.

### 2. Conversion de tipos

En `zcl_types_55` y `zcl_math_exp_55` se comparan:

- Conversion implicita: asignar un `string` a un campo `c`.
- Conversion explicita con `CONV tipo( valor )`, por ejemplo `CONV three_char( str_data )`.
- Conversion de numeros empaquetados a enteros y tratamiento de divisiones enteras.

La conversion explicita hace visible la perdida o adaptacion de longitud y tipo que puede producirse.

### 3. Operadores y expresiones

`zcl_math_exp_55` muestra suma, resta, multiplicacion, division, asignacion compuesta (`+=`, `-=`), potencia (`**`), resto (`MOD`) y division entera (`DIV`). Tambien incluye:

- Diferencia entre division entera y decimal usando `TYPE i` y `TYPE p`.
- Expresiones constructoras `VALUE #( ... )`.
- `REDUCE`, que acumula valores con `INIT`, `FOR` y `NEXT`.

### 4. Strings y procesamiento de texto

`zcl_strings_55` contiene ejemplos de:

- Longitud: `strlen` y `numofchar`.
- Mayusculas y minusculas: `to_upper`, `to_lower`.
- Reemplazo: `replace` y control de ocurrencias.
- Subcadenas por posicion (`substring`, offsets y longitudes) y por delimitador (`substring_from`, `substring_to`, `substring_before`, `substring_after`).
- Busqueda de texto, busqueda de cualquiera de varios caracteres y expresiones regulares mediante `find`, `find_any_of` y `pcre`.
- Inversion e insercion de texto (`reverse`, `insert`).
- `CONCATENATE`, `SPLIT`, `SHIFT` y `CONDENSE`, incluyendo `NO-GAPS`.
- Diferencia entre funciones que devuelven un resultado y sentencias que modifican el objeto de datos.

### 5. Condicionales y valores booleanos

`zcl_conditionals_55` cubre:

- `IF ... ELSE ... ENDIF`.
- `CASE ... WHEN ... WHEN OTHERS ... ENDCASE`.
- Expresiones `SWITCH tipo( valor WHEN ... THEN ... ELSE ... )`.
- Operadores de comparacion (`=`, `<>`, `EQ`, `NE`) y prueba de intervalos con `BETWEEN`.
- Constantes `ABAP_TRUE` y `ABAP_FALSE`.
- `XSDBOOL( condicion )` para convertir una expresion logica en un valor booleano ABAP.

### 6. Bucles y control de flujo

`zcl_looping_55` muestra:

- `WHILE ... ENDWHILE` usando `sy-index`.
- `DO ... TIMES ... ENDDO`.
- `EXIT` para salir de un bucle antes de terminarlo.
- Iteracion funcional con `FOR ... IN ...` dentro de una expresion `VALUE`.
- `SORT ... BY ... DESCENDING` para ordenar una tabla interna.

`sy-index` es un campo del sistema que identifica el indice de la iteracion en estos bucles.

### 7. Tablas internas y estructuras de linea

`zcl_tables_55` y `zcl_internal_tab_55` explican las tablas internas, que son colecciones en memoria:

- Estructuras de linea locales (`employee_row`, `sample_row`).
- `STANDARD TABLE`: acceso secuencial y orden de insercion.
- `SORTED TABLE`: mantiene el orden de su clave y permite busquedas optimizadas.
- `HASHED TABLE`: acceso por hash y clave unica.
- Claves `UNIQUE` y `NON-UNIQUE`, y `EMPTY KEY`.
- Inicializacion con `VALUE #( ( ... ) ... )`.
- `INSERT`, `APPEND`, `MODIFY`, `CLEAR` y `FILTER`.
- Lectura con `READ TABLE ... WITH KEY` y expresion de tabla `tabla[ clave = valor ]`.
- `LIKE LINE OF` para declarar una variable con el tipo de linea de una tabla.
- `sy-subrc` para comprobar el resultado de operaciones ABAP.
- `BASE` para construir una nueva estructura a partir de otra.

Tambien se muestran tres formas de modificar filas durante un `LOOP AT`:

- `INTO`: trabaja con una copia; normalmente requiere `MODIFY`.
- `ASSIGNING FIELD-SYMBOL(<fs_...>)`: modifica directamente la fila mediante un field symbol.
- `REFERENCE INTO`: modifica directamente a traves de una referencia.

### 8. Clases y encapsulacion

`zcl_parent_class_55`, `zcl_child_class_55` y `zcl_classes_worksheet_55` presentan ABAP Objects:

- Separacion entre `CLASS ... DEFINITION` e `IMPLEMENTATION`.
- Clases `PUBLIC`, `FINAL` y `CREATE PUBLIC`.
- Secciones `PUBLIC`, `PROTECTED` y `PRIVATE`.
- Atributos de instancia (`DATA`) y atributos de clase (`CLASS-DATA`), similares a datos estaticos.
- Metodos de instancia (`METHODS`) y metodos de clase (`CLASS-METHODS`), invocados con `->` y `=>`, respectivamente.
- Parametros `IMPORTING`, `EXPORTING`, `CHANGING` y `RETURNING`.
- Paso por valor mediante `VALUE(...)`.
- Constructor de instancia `constructor` y referencia a la instancia actual con `me->`.
- Llamada al constructor de la superclase con `super->constructor( )`.
- Conteo compartido de instancias mediante `CLASS-DATA`.

La visibilidad protegida permite reutilizar `add_three_numbers` desde la subclase, mientras que los miembros privados solo estan disponibles dentro de la clase que los declara.

### 9. Herencia y polimorfismo

`zcl_child_class_55` hereda de `zcl_parent_class_55` con `INHERITING FROM` y redefine `two_numbers` mediante `REDEFINITION`. La subclase tambien llama a un metodo protegido del padre.

`zcl_classes_worksheet_55` demuestra:

- Creacion de objetos con `NEW clase( ... )`.
- Referencias con `TYPE REF TO`.
- Narrow casting: una referencia a la subclase puede asignarse a una referencia al padre.
- Verificacion de tipo con `IS INSTANCE OF`.
- Resolucion del metodo segun el tipo de la referencia.
- Manejo de una excepcion al intentar crear mas instancias de las permitidas por el ejemplo.

### 10. Clases abstractas

`zcl_abstract_class_55` declara una clase `ABSTRACT` y un metodo abstracto `say_my_name`. La clase no implementa ese metodo ni puede instanciarse directamente.

`zcl_abstract_inherit_55` hereda de ella, implementa el metodo con `REDEFINITION` y lo ejecuta desde `IF_OO_ADT_CLASSRUN~MAIN`. Es el ejemplo de una plantilla abstracta que obliga a las subclases a proporcionar comportamiento concreto.

### 11. Interfaces

`z_if_add_55` declara los metodos `add_two` y `add_three`, cada uno con parametros de entrada y un valor de retorno. `zcl_interface_55` implementa la interfaz mediante:

```abap
INTERFACES z_if_add_55.

METHOD z_if_add_55~add_two.
```

El operador `~` separa el nombre de la interfaz del metodo implementado. Una interfaz define un contrato sin imponer la implementacion concreta.

### 12. Excepciones

El proyecto utiliza excepciones basadas en clases:

- `zcl_parent_class_55` declara `RAISING cx_abap_auth_check_exception` en su constructor y la lanza con `RAISE EXCEPTION NEW ...`.
- `zcl_classes_worksheet_55` captura la excepcion con `TRY ... CATCH ... ENDTRY`.
- `z_fm_exceptions_55` declara y lanza `cx_sy_zerodivide` cuando el divisor es cero.
- `zcl_database_55` incluye un ejemplo comentado de captura de `cx_sy_open_sql_db` y lectura del texto mediante `if_message~get_text( )`.

La declaracion `RAISING` hace explicito en la firma que una llamada puede propagar una excepcion.

### 13. Modulos de funciones y grupos de funciones

`zfunc_group_55` es un grupo de funciones con includes de grupo y tres modulos:

- `Z_FM_SAMPLES_55`: recibe un entero y devuelve su cuadrado.
- `Z_FM_CHANGE_55`: demuestra `IMPORTING`, `EXPORTING` y `CHANGING`, parametros opcionales con valor por defecto, referencias (`REF TO`) y desreferenciacion con `->*`.
- `Z_FM_EXCEPTIONS_55`: devuelve una division y expone una excepcion de division por cero.

En los parametros se distinguen `REFERENCE` y `VALUE`: el primero permite trabajar con el objeto referenciado, mientras que `VALUE` entrega una copia utilizable dentro del modulo. Los modulos de funciones son una forma procedural y reutilizable de encapsular logica, distinta de los metodos de ABAP Objects.

### 14. Diccionario ABAP y base de datos

`ztb_db_lesson_55.tabl.xml` define la tabla transparente `ZTB_DB_LESSON_55`:

- Clave de mandante `CLIENT` y clave de negocio `ID`.
- Campos `NAME`, `DESCRIPTION`, `COUNTRY` y `LAST_CHANGE_AT`.
- Tipos DDIC como `CLNT`, `INT4`, `CHAR` y el elemento `TIMESTAMPL`.
- Metadatos de una tabla de aplicacion y clase de desarrollo.

`zcl_database_55` usa Open SQL para:

- Obtener un timestamp con `GET TIME STAMP FIELD`.
- Preparar una tabla interna compatible con la tabla DDIC.
- Insertar varias filas con `INSERT ... FROM TABLE` (ejemplo comentado para evitar modificar datos accidentalmente).
- Leer con `SELECT ... INTO TABLE`.
- Usar `@` para marcar variables ABAP en una sentencia Open SQL.
- Transformar datos con `CORRESPONDING #( )` y `MAPPING`.
- Buscar una fila mediante una expresion de tabla.

### 15. Ejecucion en ADT

1. Importa o clona el repositorio mediante abapGit en un sistema ABAP con acceso al paquete de desarrollo.
2. Abre una clase que implemente `IF_OO_ADT_CLASSRUN`.
3. Ejecuta la clase como **ABAP Application Console**.
4. Activa las sentencias `out->write( )` comentadas para observar otros resultados.
5. Ejecuta `zcl_database_55` solo en un sistema de formacion, ya que el ejemplo activo realiza un `SELECT` y el bloque de insercion puede habilitarse si se necesita cargar datos.

## Notas de alcance

- El proyecto es material didactico y no una aplicacion de negocio completa.
- Los nombres con sufijo `_55` forman parte de los nombres de los objetos de entrenamiento.
- Parte del codigo esta comentado a proposito: sirve como catalogo de variantes de sintaxis, pero no se ejecuta hasta descomentarlo.
- La tabla de base de datos y los modulos de funciones requieren que los objetos esten activados en el sistema ABAP de destino.
