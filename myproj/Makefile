.PHONY: test

DJANGO_SETTINGS_MODULE?=myproj.settings

.DEFAULT: help
help:
	@echo make test/migrations/migrate/collectstatic/runserver/shell
test: 
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} -m coverage run manage.py test
	${PYTHON} -m coverage html

migrations:
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} manage.py makemigrations

migrate:
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} manage.py migrate

collectstatic:
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} manage.py collectstatic

runserver:
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} manage.py runserver 0.0.0.0:8000

shell:
	DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE} ${PYTHON} manage.py shell