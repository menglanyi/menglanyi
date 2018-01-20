package service;

import bean.Employee;
import bean.EmployeeExample;
import bean.Msg;
import dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service

public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll(){
        return employeeMapper.selectByExampleWithDept(null);
    }
    public void saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }
    public boolean checkUser(String empName){
        EmployeeExample employeeExample=new EmployeeExample();
        EmployeeExample.Criteria criteria=employeeExample.createCriteria();
         criteria.andEmpNameEqualTo(empName);
        long count= employeeMapper.countByExample(employeeExample);
        return count==0;
    }

    public Employee getEmp(Integer id) {
      Employee employee=employeeMapper.selectByPrimaryKey(id);
      return employee;
    }


    public void updateEmp(Employee employee) {
            employeeMapper.updateByPrimaryKeySelective(employee);
    }

    public void deleteEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatchs(List<Integer> ids) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria=example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
