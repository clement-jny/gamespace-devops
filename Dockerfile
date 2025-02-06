# ---- Base Stage ----
FROM node:22.13.0 AS base
WORKDIR /gamespace
COPY package*.json .

# ---- Development Stage ----
FROM base AS dev
RUN npm ci
COPY . .
EXPOSE 3000
CMD ["npm", "run", "dev"]

# --- Production Stage ---
FROM base AS prod
COPY . .
RUN npm ci
RUN npx prisma db seed
RUN npm run build
CMD ["npm", "run", "start"]
