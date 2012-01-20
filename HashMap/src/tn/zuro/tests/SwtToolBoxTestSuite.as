package tn.zuro.tests
{
	import tn.zuro.tests.collections.HashMapTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class SwtToolBoxTestSuite
	{
		public var hashMapTest:HashMapTest = new HashMapTest();
	}
}