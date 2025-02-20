## Run

```bash
docker compose up -d
```

## Seed the database

```bash
docker exec -it gamespace_web bash
npx prisma db push
npx prisma db seed
```

IMAGE:
gamespace-devops-gamespace_web
mariadb:11.6.2
adminer:latest

NAME:
gamespace_web_dev / gamespace_web_prod
gamespace_db_dev / gamespace_db_prod
gamespace_adminer_dev / gamespace_adminer_prod

in package.json

<!-- // "prisma": {
// "seed": "ts-node --compiler-options {\"module\":\"CommonJS\"} prisma/seed.ts"
// }, -->
