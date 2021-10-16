# Dockerized Glass DHCP GUI

This is a simple container which encapsulates the Glass DHCP GUI.  The GUI itself is exposed on port 3000 and a web services port is exposed on port 8080.

## Configuration

This container bundles with a version of `glass_config.json` which points the leases, logs and DHCP config file to `/data`.  This makes it consistent if you
are to run this in conjunction with the `networkboot/dhcpd` container; simply expose the same data volume into `/data` that you use in the DHCP container.

If you wish to use your own config file, you can mount a volume in `/opt/glass/config`.

Below are the `glass_config.json` this container uses:

```json
{
    "admin_user": "glassadmin",
    "admin_password": "glassadmin",
    "leases_file": "/data/dhcpd.leases",
    "log_file": "/data/dhcp.log",
    "config_file": "/data/dhcpd.conf",
    "shared_network_critical_threshold": "95",
    "shared_network_warning_threshold": "0",
    "slack_webhook_url": "",
    "slack_alert_channel": "",
    "leases_per_minute_threshold": "50",
    "ip_ranges_to_allow": [
      ""
    ],
    "email_alert_to": "",
    "sms_alert_to": "",
    "ws_port": 8080
  }
```

## Architecture

Currently this image is only built for `amd64` architectures.
