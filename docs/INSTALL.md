# Nuxt 3 Minimal Starter

Look at the [nuxt 3 documentation](https://v3.nuxtjs.org) to learn more.

## Setup

Make sure to install the dependencies:

```bash
# yarn
yarn install

# npm
npm install

# pnpm
pnpm install --shamefully-hoist
```

If you are using the makefile rules, this setup step is optional.

## Development Server

Start the development server on http://localhost:3000

```bash
npm run dev
```

Alternatively, you can use the following `makfile` rule:
```bash
make dev
```

## Production

Build the application for production:

```bash
npm run build
```

Alternatively, you can use the following `makfile` rule:
```bash
make
```

Locally preview production build:

```bash
npm run preview
```

Alternatively, you can use the following `makfile` rule:
```bash
make
```

Checkout the [deployment documentation](https://v3.nuxtjs.org/guide/deploy/presets) for more information.

## Reinstalling

To reinstall the dependencies, run:

```bash
make reinstall
```
