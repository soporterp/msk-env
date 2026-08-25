## Estructura del proyecto

```
compose/     -> Docker Compose
schemas/     -> Esquemas SQL/JS
init/        -> Scripts de inicialización
lib/         -> Librerías comunes
scripts/     -> Administración del laboratorio
```

## Uso

```bash
./scripts/db-up.sh

./scripts/provision.sh

./scripts/db-status.sh

./scripts/db-down.sh
```
## Ingreso a morotores individuales

```bash
./scripts/connect-oracle19ee.sh

./scripts/connect-oracle19se2.sh

./scripts/connect-oracle23ai.sh

./scripts/connect-postgres.sh

./scripts/connect-mysql.sh

./scripts/connect-mongodb.sh

./scripts/connect-mssql.sh
```

