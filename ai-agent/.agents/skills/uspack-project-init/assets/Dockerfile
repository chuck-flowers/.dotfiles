# syntax=docker/dockerfile:1

ARG NODE_VERSION=24

#########
# BASES #
#########

FROM docker.io/node:${NODE_VERSION}-alpine AS base-node-alpine

RUN apk -U --no-cache upgrade;

FROM base-node-alpine AS base-prod

# Switch to non-root user
USER node
WORKDIR /home/node

FROM base-node-alpine AS base-dev

# Corepack
RUN corepack enable;

# Switch user
USER node
WORKDIR /home/node

# PNPM
ENV PNPM_HOME="/home/node/.local/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
COPY ./package.json ./
RUN corepack prepare --activate && pnpm config set store-dir ${PNPM_HOME}/store && mkdir -p ${PNPM_HOME};

# Node Deps
COPY --parents --chown=node:node ./pnpm-*.yaml ./packages/*/package.json ./
RUN \
	--mount=type=cache,target=${PNPM_HOME}/store,uid=1000,gid=1000,mode=700 \
	--mount=type=secret,id=npmrc,target=/home/node/.npmrc,uid=1000,gid=1000,mode=400 \
	pnpm install --frozen-lockfile --prefer-offline

#######
# DEV #
#######

FROM base-dev AS dev
ARG STAGE

# Configs & Source
COPY --parents --chown=node:node \
	packages/*/tsconfig*.json \
	packages/*/src/ \
	./

CMD ["pnpm", "-r", "--parallel", "run", "dev"]

FROM dev AS build
ARG STAGE

# Compile
RUN STAGE=${STAGE} pnpm run compile

# Lint
RUN pnpm run lint

# Test
COPY --parents ./packages/*/test/unit/ ./
RUN pnpm run test:unit

##################
# NODE COMPONENT #
##################

FROM base-dev AS node-component-deploy
ARG NODE_COMPONENT
RUN \
	--mount=type=cache,target=${PNPM_HOME}/store,uid=1000,gid=1000,mode=700 \
	--mount=type=secret,id=npmrc,target=/home/node/.npmrc,uid=1000,gid=1000,mode=400 \
	pnpm -F ${NODE_COMPONENT} deploy -P deploy;

FROM base-prod AS node-component
ARG NODE_COMPONENT

# Deps
COPY --from=node-component-deploy /home/node/deploy/package.json ./
COPY --from=node-component-deploy /home/node/deploy/node_modules/ node_modules/

# Build Output
COPY --from=build /home/node/packages/${NODE_COMPONENT}/dist/ dist/

CMD ["npm", "run", "start"]

