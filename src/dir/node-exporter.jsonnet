local grafana = import "grafonnet-7.0/grafana.libsonnet";
local prometheus = import "grafonnet-7.0/target/prometheus.libsonnet";

local dashboard = grafana.dashboard;

dashboard.new(
    title="Node Exporter in Dir",
)
.addPanel(
    grafana.panel.row.new(
        title='Row',
    )
    .addPanel(
        grafana.panel.graph.new(
            title='Graph',
            
        )
    )
)
.addPanel(
        grafana.panel.graph.new(
            title='Graph',

        ).addTarget(
            prometheus.new(
                datasource='Prometheus',
                expr='up'
            )
        )
    )
