
using NUnit.Framework;
namespace GMATPrepHelper.Tests.Unit_Test
{
    [TestFixture]
    class TestSampleClass
    {
        [TestCase]
        public void sample_test_case()
        {
            Assert.IsTrue(true);
        }

        [TestCase]
        [Ignore]
        public void sample_fail_test_case()
        {
            Assert.IsTrue(false);
        }
    }
}
