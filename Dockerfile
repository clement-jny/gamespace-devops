# ---- Base Stage ----
FROM node:22.13.0 AS base
WORKDIR /gamespace
COPY package*.json .
COPY . .
RUN npm ci

# ---- Development Stage ----
FROM base AS dev
EXPOSE 3000
CMD ["npm", "run", "dev"]

# --- Production Stage ---
FROM base AS prod
RUN npm run build
CMD ["npm", "run", "start"]
