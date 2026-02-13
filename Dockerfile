FROM oven/bun:1 AS base
WORKDIR /app

# Install dependencies
FROM base AS deps
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile --production

# Final image
FROM base
COPY --from=deps /app/node_modules ./node_modules
COPY src ./src
COPY package.json tsconfig.json ./

ENV PORT=3000
EXPOSE 3000

CMD ["bun", "run", "src/server.ts"]
