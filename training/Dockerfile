from jupyter/base-notebook:latest

USER root

COPY refit/ /libs/refit/

RUN chmod +x /libs/refit/refit_init

ENV PATH="/libs/refit/:${PATH}"

USER $NB_UID