package com.lj.app.core.common.flows.task.field;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.model.ProcessModel;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.util.FileUtil;

public class FieldTest  extends FlowBaseTest {
	@Before
	public void before() {
		processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/field/flow1.xml"));
	}
	
	@Test
	public void  taskTest() throws Exception{
		 ProcessModel model = ((FlowProcess)(flowEngine.flowProcessService().getProcessById(processId))).getModel();
        TaskModel taskModel = (TaskModel)model.getNode("task1");
        System.out.println(taskModel.getFields());
	}

}
