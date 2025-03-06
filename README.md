## Run

```bash
docker compose -f compose.dev.yml up
docker compose -f compose.prod.yml up
```

## Seed the database

```bash
docker exec -it gamespace_web bash
npx prisma db push
npx prisma db seed
```

## Images

![Devops1](public/devops1.png)

![Devops2](public/devops2.png)

![Devops3](public/devops3.png)

![Devops4](public/devops4.png)
