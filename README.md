![BrightCoders Logo](img/logo-bc.png)

# Nombre del proyecto
Kanguroo.mx

## Problematica que atiende
El realizar pagos compartidos de servicios de mantenimiento y/o entretenimiento para grupos especificos o grupos de familiares.

## Propuesta de solución
Plataforma MVP que permite compartir gastos y automatizar pagos de servicios en línea direccionados a cuentas bancarias.

## Definición de requerimientos del MVP
La función principal de esta aplicación se centrará en agrupar diferentes usuarios los cuales serán administrados por un usuario administrado el cual podrá realizar la distribución de cobros por porcentajes distribuidos a los usuarios para realizar el pago de diferentes servicios compartidos.

### Requerimientos funcionales
Existirá un rol de super administrador que administre a usuarios administradores.

- Super Admin
  - Vista para administarar admins.
  - Puede gestionar administradores
  - Admin:
    - Vista de administrador con un login de autenticacion
    - Gestiona adoptados
    - Distribuye porcentaje de pagos entre adoptados
  - Adoptados:
    - Se logean como adoptados
    - Se unen a un grupo por una clave

- Reportes
  - Pagos realizados en el mes
  - Listado de adoptados
- Interfaz
  - Página Home que da informacion del proyecto
  - Pantalla de entrada a un grupo de gastos

### Requerimientos no funcionales
- Calidad
  - Utilizar estilo de código definido por la comunidad (apoyarse en Rubocop)
  - Desarrollo de pruebas unitarias.
  - Puntuación en Rubycritic: por lo menos 90 en la carpeta de la App y por lo menos 65 en la carpeta de pruebas.
  - Presentación correcta en las versiones más recientes de los principales navegadores: Edge, Chrome, Safari y Firefox.
- Deployment
  - Configuración de un servidor web (heroku o similar) para el deployment automático de actualizaciones de la app
- Frontend
  - CSS:libertad para utilizar cuaquier framework o librería, preferentemente SASS
  - Libertar para implementar cualquier framework o libreria enfocada al Frontend.

## Diseño del MVP

Incluyan en [esta carpeta](/design) su propuesta de diseño

## Recursos

- [Minimum Viable Product](https://www.agilealliance.org/glossary/mvp/#q=~(infinite~false~filters~(tags~(~'mvp))~searchTerm~'~sort~false~sortDirection~'asc~page~1))
- [Minimum Viable Product (MVP)](https://www.productplan.com/glossary/minimum-viable-product/)
- [Design Thinking](https://www.interaction-design.org/literature/topics/design-thinking)
- [El proceso de pensamiento de diseño](https://www.youtube.com/watch?v=_r0VX-aU_T8)
- [Metodología Design Thinking. Ejemplos](https://www.youtube.com/watch?v=_ul3wfKss58)
- [Design Thinking ejemplo sencillo](https://www.youtube.com/watch?v=_H33tA2-j0s)

## Desarrollo

- Clonar repositorio
- Ejecutar para instalar gemas: bundle install
- Ejecutar para instalar dependencias: yarn install
- Si es la primera vez, copiar archivo database.yml.example en database.yml 
- Colocar variables de entorno correspondientes copiando .env.example en un nuevo archivo .env
- Ejecutar rails db:create
- Si no es la primera vez asegurarse de realizar las migraciones con: rails db:migrate
