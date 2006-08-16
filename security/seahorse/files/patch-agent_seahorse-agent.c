--- agent/seahorse-agent.c.orig	Sun Aug 13 14:50:35 2006
+++ agent/seahorse-agent.c	Wed Aug 16 02:08:05 2006
@@ -280,7 +280,6 @@ main (int argc, char **argv)
     GnomeProgram *program = NULL;
     GnomeClient *client = NULL;
     
-    secmem_init (65536);
 
     /* We need to drop privileges completely for security */
 #if defined(HAVE_SETRESUID) && defined(HAVE_SETRESGID)
@@ -288,10 +287,12 @@ main (int argc, char **argv)
     /* Not in header files for all OSs, even where present */
     int setresuid(uid_t ruid, uid_t euid, uid_t suid);
     int setresgid(gid_t rgid, gid_t egid, gid_t sgid);
+    secmem_init (65536);
   
     if (setresuid (getuid (), getuid (), getuid ()) == -1 ||
         setresgid (getgid (), getgid (), getgid ()) == -1)
 #else
+    secmem_init (65536);
     if (setuid (getuid ()) == -1 || setgid (getgid ()) == -1)
 #endif
         err (1, _("couldn't drop privileges properly"));
@@ -313,7 +314,6 @@ main (int argc, char **argv)
      * All functions after this point have to print messages 
      * nicely and not just called exit() 
      */
-    daemonize (sockname);
 
     /* Handle some signals */
     signal (SIGINT, on_quit);
@@ -329,6 +329,8 @@ main (int argc, char **argv)
     /* Initialize our sub systems */
     seahorse_agent_actions_init ();
     seahorse_agent_cache_init ();
+
+    daemonize (sockname);
 
     if (seahorse_agent_io_init () == -1)
         return 1;               /* message already printed */
