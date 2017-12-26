# Yo los paro

## Instalacion local

Requiere ruby al menos 2.2.2

Instalar padrino

    gem intall padrino

Clonar el proyecto

    git clone https://github.com/piratas-ar/yolosparo_rb.git

Instalar gemas

    cd yolosparo_rb
    bundle --binstubs

Correr migraciones

    bundle exec padrino rake ar:migrate

Correr aplicacion

    bin/yolosparo_rb

Abrir con el navegador localhost:3000

Importar legigatos

    // archivos en db/import/*.json
    // el formato de los json es el mismo q para el otro yolosparo
    // los scrapers estan en el otro proyecto
    padrino rake import

## Faltan


* Twittear/comentar desde el mismo sitio
* Ordenar de forma ascendente por la cantidad de acciones ejecutadas
* Campañas (serian plantillas, guia)
* Usuarios? Generados con la primer visita. Para el feed de acciones. Extra grog por avatars autogenerados P)

...


