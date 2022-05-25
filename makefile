_IS_YARN_INSTALLED := $(shell command -v yarn)

ifeq (, $(_IS_YARN_INSTALLED))
	PM := npm run
else
	PM := yarn
endif


_CAN_PRETTY := $(shell command -v lolcat)

ifeq (, $(_CAN_PRETTY))
	COLOR =
else
	COLOR = |lolcat
endif

all: .output
	@ echo "All done!" $(COLOR)

.output: node_modules
	@ $(PM) build

preview: .output
	@ $(PM) preview

node_modules:
	@ $(PM) install > /dev/null
	@ echo "Installed node_modules" $(COLOR)

clean:
	@ rm -rf .output
	@ echo "clean done!" $(COLOR)

fclean: clean
	@ rm -rf node_modules
	@ echo "fclean done!" $(COLOR)

reset: fclean
	@ rm -rf .nuxt .vite *lock*
	@ echo "Force clean done!" $(COLOR)

reinstall: fclean node_modules
	@ echo "reinstall done!" $(COLOR)

.PHONY: all clean fclean reset preview
