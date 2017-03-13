package com.lj.app.core.common.flows.task.model;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import com.lj.app.core.common.flows.FlowBaseTest;
import com.lj.app.core.common.flows.entity.FlowOrder;
import com.lj.app.core.common.flows.entity.FlowProcess;
import com.lj.app.core.common.flows.entity.FlowTask;
import com.lj.app.core.common.flows.model.TaskModel;
import com.lj.app.core.common.util.FileUtil;

public class ModelTest extends FlowBaseTest {

	    @Before
	    public void before() {
	        processId = flowEngine.flowProcessService().deploy(FileUtil.getStreamFromClasspath("com/lj/app/core/common/flows/task/simple/flow1.xml"));
	    }

	    @Test
	    public void taskTest() throws Exception{
	        Map<String, Object> args = new HashMap<String, Object>();
	        args.put("task1.operator", new String[]{"1"});
	        FlowOrder order = flowEngine.startInstanceByName("simple", null, "2", args);
	        System.out.println("order=" + order);
	        List<FlowTask> tasks =  flowEngine.flowQueryService().getActiveTasks(order.getId().toString());
	        for(FlowTask task : tasks) {
	            TaskModel model = (TaskModel)flowEngine.FlowTaskServiceApi().getTaskModel(task.getId().toString());
	            System.out.println(model.getName());
	            List<TaskModel> models = model.getNextModels(TaskModel.class);
	            for(TaskModel tm : models) {
	                System.out.println(tm.getName());
	            }
	        }
	        
	        List<TaskModel> models =((FlowProcess)flowEngine.flowProcessService().getProcessById(processId)).getModel().getModels(TaskModel.class);
	            for(TaskModel tm : models) {
	                System.out.println(tm.getName());
	                assertNotNull(tm.getName());
	            }
	    }

	}
