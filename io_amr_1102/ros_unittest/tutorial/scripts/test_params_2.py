#! /usr/bin/env python

import rospy
import rostest
import unittest

class MyTestCase(unittest.TestCase):
    def test_param_loaded(self):
       self.value = rospy.get_param('/value',None)
       self.config_id = rospy.get_param('/config_id',None)
       self.case = [self.value,self.config_id]
       self.assertIsNotNone(self.case)
       rospy.loginfo("value is %d",self.value)

if __name__ == '__main__':
    rostest.rosrun('tutorial','test_params', MyTestCase)
        
