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

# Live development server
dev: .output
	@ $(PM) dev

# Run production preview
preview: .output
	@ $(PM) preview

# Install dependencies
node_modules:
	@ $(PM) install > /dev/null
	@ echo "Installed node_modules" $(COLOR)

# Remove production build files
clean:
	@ rm -rf .output
	@ echo "clean done!" $(COLOR)

# Remove dependencies
fclean: clean
	@ rm -rf node_modules
	@ echo "fclean done!" $(COLOR)

# Remove all cache configs
reset: fclean
	@ rm -rf .nuxt .vite *lock*
	@ echo "Force clean done!" $(COLOR)

# Force clean install of dependencies & configs
reinstall: fclean node_modules
	@ echo "reinstall done!" $(COLOR)

.PHONY: all clean dev fclean reset preview
