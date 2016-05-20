# icinga2-cachet
An Icinga2 component status notification handler to push Icinga2 notifications to Cachet API

## Prerequisites
 - Working Cachet installation
 - Cachet components to interact 
 - Working icinga2 instance 

## Installation

 - Get a Cachet API key: Create a new user in Cachet dashboard, login with this user, and get the API key in his profile.
 - Copy cachet-notification.sh to /etc/icinga2/scripts
 - Change CACHETAPI_URL and CACHETAPI_TOKEN key in cachet-notification.sh code
 - Crete a variable to match component_id in cachet for service notification
 

## Configuration

 - Make a icinga2 command:
```
	  object NotificationCommand "cachet-service-notification" {
	  import "plugin-notification-command"

	  command = [ SysconfDir + "/icinga2/scripts/cachet-notification.sh" ]

		  env = {
		    NOTIFICATIONTYPE = "$notification.type$"
		    SERVICEDESC = "$service.name$"
		    HOSTALIAS = "$host.display_name$"
		    HOSTADDRESS = "$address$"
		    SERVICESTATE = "$service.state$"
		    LONGDATETIME = "$icinga.long_date_time$"
		    SERVICEOUTPUT = "$service.output$"
		    NOTIFICATIONAUTHORNAME = "$notification.author$"
		    NOTIFICATIONCOMMENT = "$notification.comment$"
		    HOSTDISPLAYNAME = "$host.display_name$"
		    SERVICEDISPLAYNAME = "$service.display_name$"
		    USEREMAIL = "$user.email$"
		    COMPONENTID = "$host.component_id$"
		  }
	}

```
 - Add an event handler on your services:
```
  object Host {
  	 
  	    vars.notification["cachet"] = {
        component_id = [ "xxx" ]
    }

  }
```
 - reload icinga2

