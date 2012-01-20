package tn.zuro.tests.collections
{
	import flash.utils.Dictionary;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.core.throws;
	
	import tn.zuro.collections.HashMap;
	import tn.zuro.collections.IHashMapEntry;
	import tn.zuro.collections.IMap;
	
	public class HashMapTest
	{		
		private var map:IMap;
		private var PUT_NUMBER:Number;
		
		[Before]
		public function setUp():void
		{
			map = new HashMap();

			map.put("a", "value A");
			map.put("b", "value B");
			map.put("c", "value C");
			map.put("x", "value X");
			map.put("y", "value Y");
			map.put("z", "value Z");
			PUT_NUMBER = 6;
			//trace( map.getKeys() ); // b,x,z,a,c,y
			//trace( map.getValues() ); // value B,value X,value Z,value A,value C,value Y
			//trace( map.size() ); // 6

		}
		
		[After]
		public function tearDown():void
		{
		}

		[Test]
		public function testPut():void
		{
			map.put("d", "value A");
			map.put("e", "value B");
			map.put("f", "value C");
			map.put("u", "value X");
			map.put("v", "value Y");
			map.put("w", "value Z");
			
			assertEquals(map.size(), PUT_NUMBER + 6);
		}
		
		[Test]
		public function testSize():void
		{
			assertEquals(map.size(), PUT_NUMBER);
			map.put("d", "value D");
			assertEquals(map.size(), PUT_NUMBER+1);
			map.put("a", "value K");
			assertEquals(map.size(), PUT_NUMBER+1);
		}
		//*
		[Test]
		public function testRemove():void
		{
			map.remove("a");
			assertEquals(map.size(), PUT_NUMBER-1);
		}
		
		[Test]
		public function testClear():void
		{
			//trace(map.getKeys());
			map.clear();
			
			assertEquals(map.size(), 0);
			//trace(map.getKeys());
		}
		
		[Test]
		public function testContainsValue():void
		{
			assertTrue(map.containsValue("value A"));
			assertFalse(map.containsValue("value"));
		}
		
		[Test]
		public function testGetKey():void
		{
			assertEquals(map.getKey("value A"), "a");
		}
		
		[Test]
		public function testGetKeys():void
		{
			assertEquals(map.getKeys().sort(), "a,b,c,x,y,z");
		}
		
		[Test]
		public function testPutAll():void
		{
			var dict:Dictionary = new Dictionary();
			dict["d"] = "value D";
			dict["e"] = "value E";
			map.putAll(dict);
			assertEquals(map.size(), PUT_NUMBER + 2);
		}
		
		[Test]
		public function testContainsKey():void
		{
			assertTrue(map.containsKey("a"));
			assertFalse(map.containsKey("h"));
		}
		
		[Test]
		public function testGetValue():void
		{
			assertEquals(map.getValue("a"), "value A");
		}
		
		[Test]
		public function testGetValues():void
		{
			assertEquals(map.getValues().sort(), "value A,value B,value C,value X,value Y,value Z");
		}
		
		[Test]
		public function testIsEmpty():void
		{
			assertFalse(map.isEmpty());
		}
		
		[Test]
		public function testIsAllUndefined():void
		{
			map.reset();
			assertTrue(map.isAllUndefined());
		}
		
		[Test]
		public function testReset():void
		{
			map.reset();
			trace(map.getValues());
		}
		
		[Test]
		public function testResetAllExcept():void
		{
			var key:* = "a";
			map.resetAllExcept(key);
			assertTrue(map.containsKey(key));
			assertFalse(map.isAllUndefined());
			map.put(key, undefined);
			assertTrue(map.isAllUndefined());
			
		}
		
		[Test]
		public function testClearAllExcept():void
		{
			var key:* = "y";
			map.clearAllExcept(key);
			assertTrue(map.containsKey(key));
			assertFalse(map.isEmpty());
			assertEquals(map.size(), 1);
			map.remove(key);
			assertTrue(map.isEmpty());
		}
		
		[Test]
		public function testGetEntries():void
		{
			var entries:Array = map.getEntries();
			for each (var entry:IHashMapEntry in entries)
			{
				assertEquals(entry.key, map.getKey(entry.value));
				assertEquals(entry.value, map.getValue(entry.key));
			}
			assertEquals(entries.length, PUT_NUMBER);
		}
	}
}