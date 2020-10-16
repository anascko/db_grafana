FROM grafana/grafana:6.4.0 

COPY ./entrypoint.sh /etc/grafana/entrypoint.sh

USER root
RUN chmod +x /etc/grafana/entrypoint.sh

ENTRYPOINT [ "/etc/grafana/entrypoint.sh" ]
