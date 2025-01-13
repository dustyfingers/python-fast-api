# pull base python image
FROM python:3.9-bookworm

# copy .toml file for poetry dep management from local storage to image into created /usr/app/ folder
COPY pyproject.toml /usr/app/

# copy app files over into image
COPY main.py /usr/app/

# like cd'ing into the created /usr/app dir within the image
# the rest of the commands are executed from there
WORKDIR /usr/app

# install poetry
RUN pip install poetry

# config poetry to not create a virtual env
RUN poetry config virtualenvs.create false

# install dependencies
RUN poetry install --no-root

# FIXME: this process exits immediately
# poetry run python main.py doesnt seem to work
# neither does python main.py
# neither does python ./main.py
# what gives? the image itself seems to have the correct files in it
CMD ['python', 'main.py']