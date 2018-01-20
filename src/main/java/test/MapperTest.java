package test;

import bean.Department;
import bean.Employee;
import bean.EmployeeExample;
import dao.DepartmentMapper;
import dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

//测试dao层的工作
/*
* 1.导入springTest模块
* 2.ContextConfiguration指定spring配置文件的位置
* 3直接autowired要使用的组件
* */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    @Test
    /*
    * 测试departmentMapper
    * */
    public void testCURD(){
    /*//1.创建springIOC容器
        ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
        //2.从容器中获取mapper
        ioc.getBean(DepartmentMapper.class);*/
    /*
    * 使用spring的test
    * */
     //1.插入几个部门
         /*
       departmentMapper.insertSelective(new Department(null,"开发部"));
       departmentMapper.insertSelective(new Department(null,"测试部"));*/
       //2.员工插入
       // employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@qq.com",1));
        //3.执行批量操作
   /* EmployeeMapper mapper=sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i <100 ; i++) {
           String Uid= UUID.randomUUID().toString().substring(0,5)+i;
        mapper.insertSelective(new Employee(null,Uid,"M",Uid+"@qq.com",1));
        }
        System.out.println("完成");*/
      //  System.out.println(employeeMapper.selectByExampleWithDept(new EmployeeExample()));
       // System.out.println(employeeMapper.selectByPrimaryKey(3));
      /* Employee e= new Employee(1,"panran","M","Jerry@qq.com",1);
        employeeMapper.updateByPrimaryKeySelective(e);
        System.out.println(employeeMapper.selectByPrimaryKey(1));*/
      employeeMapper.deleteByPrimaryKey(1);
        System.out.println(employeeMapper.selectByPrimaryKey(1));
    }
}
