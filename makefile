_IS_YARN_INSTALLED := $(shell command -v yarn)

# If yarn is installed, use it to install dependencies
ifeq (, $(_IS_YARN_INSTALLED))
	PM := npm run
else
	PM := yarn
endif


# Prettify the output when lolcat is installed
_CAN_PRETTY := $(shell command -v lolcat)

ifeq (, $(_CAN_PRETTY))
	COLOR =
else
	COLOR = |lolcat
endif


all: .output
	@ echo "All done!" $(COLOR)

# Create production build
.output: node_modules
	@ $(PM) build

# UTILS ------------------------------------------------------------------

# Live development server
dev: node_modules
	@ $(PM) dev

# Production build
build: .output

# Run production preview
preview: build
	@ $(PM) preview

# Pre-render production as static HTML
gen: build
	@ $(PM) generate

# Run linter
lint: node_modules
	@ $(PM) lint

# Install dependencies
node_modules:
	@ $(PM) install > /dev/null
	@ echo "Installed node_modules" $(COLOR)

# CLEANING ---------------------------------------------------------------

# Remove production build files
clean:
	@ rm -rf .output dist
	@ echo "clean done!" $(COLOR)

# Remove dependencies
fclean: clean
	@ rm -rf node_modules .nuxt .vite
	@ echo "fclean done!" $(COLOR)

# OTHER ------------------------------------------------------------------

# Remove dependencies lock
dep-unlock: fclean
	@ rm -rf *.lock *-lock.json
	@ echo "Unlocked dependencies!" $(COLOR)

# Force clean install of dependencies & configs
reinstall: fclean node_modules
	@ echo "reinstall done!" $(COLOR)

.PHONY: all dev build preview gen lint clean fclean reset preview
