FROM python:3.9

# init image
RUN apt-get update
# RUN pip install pipenv gdown
RUN pip install pipenv

# User change
RUN useradd --create-home appuser
USER appuser
WORKDIR /home/appuser

# Copy data
COPY ./Pipfile .
COPY ./Pipfile.lock .
RUN pipenv install --dev --system --deploy

COPY . .

VOLUME [ "./src" ]

EXPOSE 8000

ENTRYPOINT ["sh","entrypoint.sh"]