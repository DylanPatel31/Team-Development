using System;
using Class_Library;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Test_Framework.Irbaaz
{
    [TestClass]
    public class tstTeams
    {
        [TestMethod]
        public void InstanceOK()
        {
            //create an instance of the class we want to create
            clsTeam ATeam = new clsTeam();
            //test to see that it exists
            Assert.IsNotNull(ATeam);
        }
    }
}
