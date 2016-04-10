# README - ALPHA WARNING!!

*Development of this project began on April 8, 2016.  Many of the
features described below may be incomplete or untested.  It is not
even really in an Alpha state yet.  In particular, absolutely no
testing has been implemented.*

## What is Metatron?

First of all, Metatron is the name of the heavenly scribe (an angel) in
the Jewish tradition.  As Wikipedia says:

>  Metatron (Hebrew מטטרון) or Mattatron is an archangel in Judaism, known as
>  the Recording Angel or the Chancellor of Heaven (which makes Adramelech his
>  infernal counterpart). The name Metatron is not mentioned in the Hebrew
>  bible, nor is it mentioned in the early Enoch literature. How the name
>  originated is a matter of debate. Although Metatron is mentioned in a few brief
>  passages in the Talmud, he appears primarily in mystical Kabbalistic texts
>  within the Rabbinic literature. In that tradition, he is the highest of the
>  angels and serves as the celestial scribe or "recording angel"

That this software is named "Metatron" should give you a hint as to what it
does.  The purpose of Metatron is to keep track of every node and IP on your
network.  In this sense, it resembles an inventory management app (such as
odoo) or an IP management application (such as NIPAP.)  However, the concept
of Metatron is different -- Metatron seeks to be a "node registry", and
Metatron is specifically designed to keep track of any arbitrary information
you might need about devices and feed it to other services that help you
manage your infrastructure.

So, the purpose of Metatron is to the canonical source of information about
your network and the nodes on it.  Then, Metatron will have plugins to export
that information to other services (e.g. LibreNMS, SmokePing, Ansible, etc.)

## Tracked information
Examples of information that Metatron might track include:

* [x] Node name
* [x] Node description
* [ ] Node hardware
* [x] Node IP addresses (plural!)
* [x] SNMP parameters (communities, versions, etc.)
* [ ] OS levels
* [x] IP networks and addresses (including management of subnetting)
* [ ] Frequencies for wireless devices
* [ ] Device locations
* [x] Arbitrary information in key-value format using properties.  

## Planned integrations for beta
* [ ] LibreNMS (Network Management and graphic)
* [ ] Ansible (Device configuration management)
* [ ] Oxidized (Network device configuration backup)

## Discovery
Prior to 1.0, there is a plan to develop a very solid network discovery
package to feed data into Metatron.  
