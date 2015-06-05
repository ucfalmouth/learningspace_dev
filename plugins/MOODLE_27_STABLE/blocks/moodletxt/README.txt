------------------------------------------
MOODLETXT SMS PLUGIN FOR CONNECTTXT

Author:   Greg J Preece
Company:  Blackboard ConnectTxt
Location: Vancouver, Canada
Contact:  connecttxtsupport@blackboard.com
Version:  3.0.7
Release Date: 15th July 2014
------------------------------------------


--WHAT IS IT?--

moodletxt is a block that allows teachers and administrators to send SMS/text 
messages to their students directly from the Moodle system. It is available 
to all bbconnecttxt.com customers, and trial accounts can be 
provided on request. The module supports both inbound and outbound messaging, 
allowing teachers to text their students and receive replies without ever 
leaving Moodle. It also supports text message status updates, user-personalised 
messages, message templates and signatures, and more.


--INSTALLATION--

Installation is the same as any other block: simply drop the moodletxt folder
into your Moodle installation's /blocks directory, then log into Moodle as
an administrator and click the Notifications link on the Site Administration
menu. The automatic installation/upgrade scripts will do the rest.

When upgrading, it is recommended to remove the old moodletxt block completely
and replace it with a fresh copy from the new installer, before running the
upgrade script. All data is held within the database, so you will not lose 
anything by doing this, and it helps prevent conflicts between versions.


--IMPORTANT NOTICE FOR UPGRADERS FROM MOODLE 1.9.x--

If you are upgrading from Moodle 1.9 to 2.3 and beyond, then Moodle requires 
that you first upgrade to Moodle 2.2, and then to 2.3 or above from there.  
If you are planning such an upgrade, and this includes moodletxt, then you must 
upgrade moodletxt to version 3 when you upgrade your Moodle installation to 2.2,
 not after the upgrade to 2.3 or above. This is because Moodle's upgrade system 
changed with Moodle 2.3, and as a result moodletxt cannot support direct 
upgrades from Moodle 1.9 to 2.3 or above.


--STAYING UP TO DATE--

As well as the Moodle plugin repository, news and updates on the plugin can
be found on our website, at the following address:

http://www.bbconnecttxt.com/preloginjsp/txttools/plugins.jsp

An RSS feed is available at:

http://www.bbconnecttxt.com/preloginjsp/moodletxt/rss.xml


--NEW IN 3.0.7--

 * Fixed issue on compose page where the signature checkbox always
    removed text from a message.
 * Fixed several minor rendering issues on compose page.
 * Fixed several rendering issues on account listing page that may 
    occur on certain systems.
 * In Moodle 2.5 and above, jQuery is now loaded via Moodle's new jQuery
    loader mechanism. This helps prevent conflicts and removes the need
    for this to be controlled manually by the administrator.
 * Fixed incorrect title on inbound filter management page
 * Fixed a bug in the account settings page where the user searcher
    sometimes didn't show results.
 * Fixed the "last name" tag for merging contact details into messages.


--NEW IN 3.0.6--

 * Fixed issue when sending group messages to groups that contain
    no valid phone numbers
 * Fixed issue with inbound numbers where matches against addressbook
    contacts would cause the message to not be saved.
 * Modified status updates database queries in cron job to improve
    performance on larger databases
 * Fixed link-buttons on addressbook contacts list used to delete contacts
 * Fixed minor issue on preferences page where form header did not
    update when editing a template in Moodle 2.5 and above


--NEW IN 3.0.5--

 * Fixed issue on compose page with groups not being displayed
    in the recipient list.
 * Modified inline contact editing to accept blank values for name fields.
 * Updated output code for greater compatibility with Moodle 2.5
 * Created additional validation for values passed to Moodletxt via AJAX handlers.
 * Added code to prevent exceptions in Moodletxt's cron task affecting the rest
    of a Moodle installation.
 * Prefixed many pieces of code and CSS to prevent potential namespace collisions.
 * Fixing minor issue on received messages page where a confirmation dialog
    would appear twice.
 * Fixed missing capability in Moodle 2.4 and above.
 * Removed unused capability.


--NEW IN 3.0.4--

 * Fixed error on accounts page where the number of accounts wasn't
    correctly calculated in Moodle 2.4, which caused account updates to hang.
 * Fixed bug that prevented lib.js from being cached in Moodle 2.4 and above.


--NEW IN 3.0.3--

* Compatibility with Moodle 2.4
* Fixed error on composition page that was causing scheduled messages to
    be sent out immediately.
* Fixed data retrieval error that caused scheduled messages to show
    an incorrect scheduling time on the message details page.


--NEW IN 3.0.2--

* Corrected permissions error on status page that prevented teachers viewing
    the status of sent messages
* Modified the list of recipient users on the inbox page to include
    users granted the :receivemessages permission at both system and current
    course level.
* Updated CSS file to use dynamic include syntax for image URLs
* Removed accounts with disabled inbound access from the filter management
    form.


--NEW IN 3.0.1--

* Patch for running the block on MySQL 5.1 or higher.


--NEW IN 3.0 SINCE 2.4--

* Export functionality on all table-based listings (sent messages, 
    message status, message inbox, etc)
* Event-based messaging via the moodletxt+ message processor plugin
* Re-written user interface, to use standard Moodle components wherever 
    possible. Greater compatibility with themes.
* New tag-based inbox page, removing the old fashioned folder-based design.


--LICENCE--

moodletxt is distributed as GPLv3 software, and is provided free of charge without warranty. 
A full copy of this licence can be found @
http://www.gnu.org/licenses/gpl.html
In addition to this licence, as described in section 7, we add the following terms:
  - Derivative works must preserve original authorship attribution (@author tags and other such notices)
  - Derivative works do not have permission to use the trade and service names 
    "ConnectTxt", "txttools", "moodletxt", "moodletxt+", "Blackboard", "Blackboard Connect" or "Cy-nap"
  - Derivative works must be have their differences from the original material noted,
    and must not be misrepresentative of the origin of this material, or of the original service

Anyone using, extending or modifying moodletxt indemnifies the original authors against any contractual
or legal liability arising from their use of this code.
