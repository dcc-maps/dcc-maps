
-- Crear roles
CREATE ROLE g_cons;
CREATE ROLE g_admin;

-- Usuarios de edición de GIS
CREATE ROLE gisadmin login PASSWORD 'your_password' IN ROLE g_admin;
-- Usuarios de consulta
CREATE ROLE user_qgis      login PASSWORD 'otro_password' IN ROLE g_cons;


-- Asignamos permisos a los roles

-- Permiso total a los esquemas
GRANT ALL ON SCHEMA limit_admin TO g_admin;
GRANT ALL ON SCHEMA medi_ambient TO g_admin;
-- Permiso total a las tablas de cada esquema
GRANT ALL ON ALL TABLES IN SCHEMA limit_admin TO g_admin;
GRANT ALL ON ALL TABLES IN SCHEMA medi_ambient TO g_admin;
-- Permiso total a las sequencias
GRANT ALL ON ALL SEQUENCES IN SCHEMA limit_admin TO g_admin;
GRANT ALL ON ALL SEQUENCES IN SCHEMA medi_ambient TO g_admin;


-- Permiso para usar los esquemas y crear tablas
GRANT CREATE, USAGE ON SCHEMA limit_admin TO g_cons;
GRANT CREATE, USAGE ON SCHEMA medi_ambient TO g_cons;
-- Permiso para todas las tablas de los esquemas
GRANT SELECT ON ALL TABLES IN SCHEMA limit_admin TO g_cons;
GRANT SELECT ON ALL TABLES IN SCHEMA medi_ambient TO g_cons;

--Aplicació de crear només rol usuari
CREATE ROLE g_cons;
CREATE ROLE user_qgis      login PASSWORD '1234' IN ROLE g_cons;
GRANT CREATE, USAGE ON SCHEMA limit_admin TO g_cons;
GRANT CREATE, USAGE ON SCHEMA medi_ambient TO g_cons;
GRANT SELECT ON ALL TABLES IN SCHEMA limit_admin TO g_cons;
GRANT SELECT ON ALL TABLES IN SCHEMA medi_ambient TO g_cons;

--Missatge bloc de notes que guardem com a .bat per fer una importació d'un arxiu shapefile. Abans creem l'esquema a postgis de 'topografia'--
::
:: mi primer bat
::
set ogr2ogr="C:\Program Files\QGIS 3.16\bin\ogr2ogr.exe"
rem conexión a PostgreSQL
set pg="host=localhost port=5432 dbname=CursPostgres schemas=topografia user=gisadmin password=xxxxx"
%ogr2ogr% -f "PostgreSQL" PG:%pg% bt5mv20sh0f285131al1r060.shp -overwrite
::
pause
