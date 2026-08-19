FROM oven/bun:1 AS base
WORKDIR /app

# Install dependencies
FROM base AS deps
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile --production

# Final image
FROM base
COPY --from=deps --chown=bun:bun /app/node_modules ./node_modules
COPY --chown=bun:bun src ./src
COPY --chown=bun:bun package.json tsconfig.json ./

ENV PORT=3000
EXPOSE 3000

USER bun

CMD ["bun", "run", "src/server.ts"]
