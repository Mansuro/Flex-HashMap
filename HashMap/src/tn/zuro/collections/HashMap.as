package tn.zuro.collections
{
	import flash.utils.Dictionary;
	
	/**
	 *
	 * <code>HashMap</code> provides a standardized API for working
	 * with <code>key</code> / <code>value</code> pairs.
	 *
	 * @example The following example demonstrates a typical client
	 * implementation of a <code>Hashmap</code> instance in which
	 * <code>key</code> / <code>value</code> pairs are added and
	 * retrieved.
	 *
	 * <listing version="3.0">
	 *
	 * import com.swallow.collections.HashMap;
	 * import com.swallow.collections.IMap;
	 *
	 * private function init() : void
	 * {
	 *     var map:IMap = new HashMap();
	 *     map.put("a", "value A");
	 *     map.put("b", "value B");
	 *     map.put("c", "value C");
	 *     map.put("x", "value X");
	 *     map.put("y", "value Y");
	 *     map.put("z", "value Z");
	 *
	 *     trace( map.getKeys() ); // b,x,z,a,c,y
	 *     trace( map.getValues() ); // value B,value X,value Z,value A,value C,value Y
	 *     trace( map.size() ); // 6
	 * }
	 *
	 * </listing>
	 *
	 * @see http://livedocs.adobe.com/flex/3/langref/flash/utils/Dictionary.html flash.utils.Dictionary
	 * @author Nithiyananthan.S / 16-Mar-2011
	 *
	 */
	public class HashMap implements IMap
	{
		/**
		 *
		 * Defines the underlying <code>Dictionary</code> instance to
		 * which each <code>key</code> / <code>value</code> pair is added.
		 *
		 * @see http://livedocs.adobe.com/flex/3/langref/flash/utils/Dictionary.html flash.utils.Dictionary
		 *
		 */
		protected var _map:Dictionary = new Dictionary() ;
		
		
		/**
		 *
		 * <code>HashMap</code> constructor initializes a new instance
		 * using <em>weak key</em> references by default in order to ensure
		 * objects are eligible for Garbage Collection immediately after they
		 * are no longer being referenced.
		 *
		 * @example
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap(object, false );
		 *
		 * </listing>
		 *
		 * @param Specifies if weak key references should be used.
		 *
		 */
		public function HashMap(value:Object=null,useWeakReferences:Boolean = true)
		{
			_map = new Dictionary( useWeakReferences );
			if(value)
			{
				for ( var prop:* in value )
				{
					put( prop, value[prop] );
				}
			}
			
		}
		
		/**
		 *
		 * Adds a <code>key</code> / <code>value</code> pair to the map.
		 *
		 * @example The following demonstrates adding a <code>key</code>
		 * <code>value</code> pair to a map via <code>put();</code>.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", null );
		 *
		 * </listing>
		 *
		 * @param The <code>key</code> to add to the map.
		 * @param The <code>value</code> of the specified <code>key</code>.
		 *
		 */
		public function put(key:*, value:*) : void
		{
			_map[key] = value;
		}
		/**
		 *
		 * Places all <code>key</code> / <code>value</code> pairs defined
		 * within the <code>Dictionary</code> instance into the map.
		 *
		 * @example The following demonstrates adding <code>key</code>
		 * <code>value</code> pairs from a <code>Dictionary</code>
		 * instance to a <code>HashMap</code> instance.
		 *
		 * <listing version="3.0">
		 *
		 * var dict:Dictionary = new Dictionary();
		 * dict.a = "foo";
		 * dict.b = "bar";
		 *
		 * var map:IMap = new HashMap();
		 * map.putAll( dict );
		 *
		 * trace( map.getKeys() ); // a, b
		 * trace( map.getValues() ); // foo, bar
		 *
		 * </listing>
		 *
		 * @param <code>Dictionary</code> of name / value pairs.
		 *
		 */
		public function putAll(table:Dictionary) : void
		{
			for ( var prop:* in table )
			{
				put( prop, table[prop] );
			}
		}
		
		/**
		 *
		 * Removes a <code>key</code> / <code>value</code> pair from the
		 * map.
		 *
		 * @example
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * trace( map.getValue( "username" ) ); // efeminella
		 *
		 * map.remove( "username" );
		 *
		 * trace( map.getValue ); // undefined
		 * trace( map.size ); // 0
		 *
		 * </listing>
		 *
		 * @param The <code>key</code> in which to remove from the map.
		 *
		 */
		public function remove(key:*) : void
		{
			//_map[ key ] = undefined;
			delete _map[ key ];
		}
		
		/**
		 *
		 * Determines if the specified <code>key</code> exists in the map.
		 *
		 * @example
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * trace( map.getValue( "username" ) ); // efeminella
		 *
		 * map.remove( "username" );
		 *
		 * trace( map.getValue ); // undefined
		 * trace( map.size ); // 0
		 *
		 * </listing>
		 *
		 * @param  The <code>key</code> in which to determine existance
		 *         in the map.
		 * @return <code>true</code> if the <code>value</code> exists,
		 *         otherwise <code>false</code>.
		 *
		 */
		public function containsKey(key:*) : Boolean
		{
			return _map.hasOwnProperty( key );
		}
		
		/**
		 *
		 * Determines if the specified <code>value</code> exists in the
		 * <code>IMap</code> instance.
		 *
		 * @example
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.containsValue( "efeminella" ) ); //true
		 * trace( map.containsValue( "foo" ) ); //false
		 *
		 * </listing>
		 *
		 * @param  The <code>value</code> in which to determine existance
		 *         in the <code>IMap</code> instance.
		 * @return <code>true</code> if the <code>value</code> exists,
		 *         otherwise <code>false</code>.
		 *
		 */
		public function containsValue(value:*) : Boolean
		{
			for ( var key:* in _map )
			{
				if ( _map[ key ] == value )
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 *
		 * Returns the <code>value</code> assigned to the specified
		 * <code>key</code> in the map.
		 *
		 * <p>
		 * If multiple <code>keys</code> exists in the map with the same
		 * <code>value</code>, the first key located will be returned.
		 * </p>
		 *
		 * @example The following demonstrates calling <code>getKey()</code>
		 * where the specified <code>value</code> has been assigned to only
		 * one <code>key</code>. This is the typical scenario.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getKey( "efeminella" ) ); //username
		 *
		 * </listing>
		 *
		 * @example The following demonstrates calling <code>getKey()</code>
		 * where the specified <code>value</code> has been assigned to more
		 * than one <code>key</code>.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "a", true );
		 * map.put( "b", false );
		 * map.put( "c", false );
		 * map.put( "d", true );
		 *
		 * trace( map.getKey( false ) ); //b
		 *
		 * </listing>
		 *
		 * @param  The <code>key</code> to retrieve the <code>value</code> of.
		 * @return The <code>value</code> of the specified <code>key</code>.
		 *
		 */
		public function getKey(value:*) : *
		{
			var identifier:* = undefined;
			
			for ( var key:* in _map )
			{
				if ( _map[ key ] == value )
				{
					identifier = key;
					break;
				}
			}
			return identifier;
		}
		
		/**
		 *
		 * Returns each <code>key</code> which has been defined in the map.
		 *
		 * @example The following demonstrates retrieving all <code>keys</code>
		 * defined in the map.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "a", true );
		 * map.put( "b", false );
		 * map.put( "c", false );
		 * map.put( "d", true );
		 *
		 * trace( map.getKeys() ); //a,b,c,d
		 *
		 * </listing>
		 *
		 * @return <code>Array</code> of <code>key</code> identifiers.
		 *
		 */
		public function getKeys() : Array
		{
			var keys:Array = [];
			
			for ( var key:* in _map )
			{
				keys.push( key );
			}
			return keys;
		}
		
		/**
		 *
		 * Returns the <code>value</code> assigned to the specified <code>key</code>
		 * in the map.
		 *
		 * @example The following demonstrates retrieving a <code>value</code>
		 * assigned to the specified <code>key</code>.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getValue( "username" ) ); //efeminella
		 * trace( map.getValue( "password" ) ); //dda7806a4847ec61b5940c2623a5aabd
		 *
		 * </listing>
		 *
		 * @param  The <code>key</code> to retrieve the <code>value</code> of.
		 * @return The <code>value</code> of the specified <code>key</code>.
		 *
		 */
		public function getValue(key:*) : *
		{
			return _map[key];
		}
		
		/**
		 *
		 * Retrieves the <code>value</code> assigned to each <code>key</code>
		 * in the map.
		 *
		 * @example The following demonstrates calling <code>getValues()</code>
		 * in order to retrieve the <code>value</code> of each <code>key</code>
		 * defined in the map.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
		 *
		 * </listing>
		 *
		 * @return <code>Array</code> containing the value of each <code>key</code>
		 *         defined in the map.
		 *
		 */
		public function getValues() : Array
		{
			var values:Array = [];
			
			for (var key:* in _map)
			{
				values.push( _map[key] );
			}
			return values;
		}
		
		/**
		 *
		 * Retrieves the <code>size</code> of the map. The size is determined
		 * based on the number of <code>keys</code> defined in the map.
		 *
		 * @example The following demonstrates calling <code>size();</code>
		 * to determine the number of entries (<code>keys</code>) defined
		 * in the map.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "a", true );
		 * map.put( "b", false );
		 * map.put( "c", false );
		 * map.put( "d", true );
		 *
		 * trace( map.size() ); //4
		 *
		 * </listing>
		 *
		 * @return The number of <code>keys</code> defined in the map.
		 *
		 */
		public function size() : int
		{
			var length:int = 0;
			
			for ( var key:* in _map )
			{
				length++;
			}
			return length;
		}
		
		/**
		 *
		 * Determines if the map is empty. This essentially equates to
		 * evaluating if there are any <code>keys</code> defined in the
		 * map.
		 *
		 * @example The following demonstrates calling <code>isEmpty</code>
		 * to determine if there have been any <code>keys</code> previously
		 * added to the map.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "a", 1 );
		 * map.put( "b", 2 );
		 *
		 * trace( map.isEmpty() ); //false
		 *
		 * </listing>
		 *
		 * @return <code>true</code> if empty, otherwise <code>false</code>.
		 *
		 */
		public function isEmpty() : Boolean
		{
			return size() <= 0;
		}
		
		/**
		 *
		 * Assigns <code>undefined</code> as the <code>value</code> of each
		 * <code>key</code> in the map.
		 *
		 * @example The following demonstrates resetting all <code>keys</code>
		 * in a <code>HashMap</code> instance.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
		 *
		 * map.reset();
		 *
		 * trace( map.getValues() ); //undefined, undefined
		 *
		 * </listing>
		 *
		 */
		public function reset() : void
		{
			for ( var key:* in _map )
			{
				_map[ key ] = undefined;
			}
			if (!isAllUndefined())
			{
				reset();
			}
			
		}
		
		/**
		 *
		 * Assigns <code>undefined</code> as the <code>value</code> of each
		 * <code>key</code> in the map, with the exception of the specified
		 * <code>key</code>.
		 *
		 * @example The following demonstrates resetting all <code>keys</code>
		 * in a <code>HashMap</code> instance.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getValues() ); //efeminella, dda7806a4847ec61b5940c2623a5aabd
		 *
		 * map.resetAllExcept( "username" );
		 * trace( map.getValues() ); //efeminella, undefined
		 *
		 * </listing>
		 *
		 * @param the key which is not to be cleared from the map
		 *
		 */
		public function resetAllExcept(keyId:*) : void
		{
			for ( var key:* in _map )
			{
				if ( key != keyId )
				{
					_map[ key ] = undefined;
				}
			}
		}
		
		/**
		 *
		 * Clears all <code>key</code> / <code>value</code> pairs which have
		 * been defined in the map. This operation effectively removes all
		 * items from the map, and puts it back in its initialized state.
		 *
		 * @example The following demonstrates clearing all items from a map.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.size() ); //2
		 *
		 * map.clear();
		 *
		 * trace( map.size() ); //0
		 *
		 * </listing>
		 *
		 */
		public function clear() : void
		{
			for ( var key:* in _map )
			{
				remove( key );
			}
			
		}
		
		/**
		 *
		 * Clears all <code>key</code> / <code>value</code> pairs which
		 * have been defined in the map, with the exception of the specified
		 * <code>key</code>.
		 *
		 * @example The following demonstrates clearing all items from a
		 * map with the exception of the specified item.
		 *
		 * <listing version="3.0">
		 *
		 * var map:IMap = new HashMap();
		 * map.put( "username", "efeminella" );
		 * map.put( "password", "dda7806a4847ec61b5940c2623a5aabd" );
		 *
		 * trace( map.getValue( "username" ) ); //efeminella
		 * trace( map.getValue( "password" ) ); //dda7806a4847ec61b5940c2623a5aabd
		 * trace( map.size() ); //2
		 *
		 * map.clearAllExcept( "username" );
		 *
		 * trace( map.getValue( "username" ) ); //efeminella
		 * trace( map.getValue( "password" ) ); //undefined
		 * trace( map.size() ); //1
		 *
		 * </listing>
		 *
		 * @param The <code>key</code> which is not to be cleared from the map.
		 *
		 */
		public function clearAllExcept(keyId:*) : void
		{
			for ( var key:* in _map )
			{
				if ( key != keyId )
				{
					remove( key );
				}
			}
		}
		
		/**
		 *
		 * Returns an <code>Array</code> of <code>IHashMapEntry</code>
		 * instances based on all <code>key</code> / <code>value</code>
		 * pairs defined in the map.
		 *
		 * @param <code>Array</code> of <code>IHashMapEntry</code> instances.
		 *
		 */
		public function getEntries() : Array
		{
			var list:Array = new Array();
			
			for ( var key:* in _map )
			{
				list.push( new HashMapEntry( key, _map[key] ) );
			}
			return list;
		}
		
		/**
		 * Checks if all elements are undefined. If there is a value which is
		 * different than undefined, it returns false
		 * 
		 * @return <code>true</code> if all values are undefined,
		 *         otherwise <code>false</code>.
		 */ 
		public function isAllUndefined():Boolean
		{
			var values:Array = getValues();
			for each (var value:* in values)
			{
				if (value !=undefined)
					return false;
			}
			return true;
		}
		
	}
}