--- cpp.orig/include/Freeze/Map.h	2011-06-15 21:43:58.000000000 +0200
+++ cpp/include/Freeze/Map.h	2012-03-04 20:14:52.000000000 +0100
@@ -426,7 +426,7 @@
 
     ConstIterator(MapHelper& mapHelper, const Ice::CommunicatorPtr& communicator) :
         _helper(IteratorHelper::create(mapHelper, true)), 
-        _communicator(_communicator),
+        _communicator(communicator),
         _refValid(false)
     {
     }
