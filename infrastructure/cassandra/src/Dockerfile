FROM cassandra

ADD ./cql/ cql/

RUN chmod -R 777 /cql

ENTRYPOINT ["/cql/entrypoint-wrap.sh"]
CMD ["cassandra", "-f"]