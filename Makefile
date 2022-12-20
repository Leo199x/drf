.PHONY: help prepare_env test makemigrations migrate collectstatic run

VENV_NAME?=env
VENV_ACTIVATE=. $(VENV_NAME)/bin/activate
PYTHON=${VENV_NAME}/bin/python

.DEFAULT: help
help:

	@echo "make prepare_env"
	@echo "       activates the virtual env"
	@echo "make test"
	@echo "       run tests"
	@echo "make makemigrations"
	@echo "       make migrations of the project"
	@echo "make migrate"
	@echo "       migrate migrations of the project"
	@echo "make collectstatic"
	@echo "       collect static files"
	@echo "make runserver"
	@echo "       run the development server"
	@echo "make shell"
	@echo "       run python shell with the django settings"
	@echo "make clean"
	@echo "       remove the virtual env"

	
prepare_env: $(VENV_NAME)/bin/activate

$(VENV_NAME)/bin/activate: 
	test -d $(VENV_NAME) || python -m venv $(VENV_NAME)
	${PYTHON} -m pip install -U pip
	${PYTHON} -m pip install -r requirements.txt
	${PYTHON} -m pip install coverage
	touch $(VENV_NAME)/bin/activate	

test: prepare_env
	PYTHON=../${PYTHON} make test -C myproj

migrations: prepare_env
	PYTHON=../${PYTHON} make migrations -C myproj

migrate: prepare_env
	PYTHON=../${PYTHON} make migrate -C myproj

collectstatic: prepare_env
	PYTHON=../${PYTHON} make collectstatic -C myproj

runserver: prepare_env
	PYTHON=../${PYTHON} make runserver -C myproj

shell: prepare_env
	PYTHON=../${PYTHON} make shell -C myproj

clean:
	@rm -rf $(VENV_NAME)