package com.ibs.training.project.service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;



import com.ibs.training.project.model.FlightDetailsModel;

public class Search {

	public LinkedList<LinkedList<String>> flightsearch(String src, String dest, List<FlightDetailsModel> flights) {
		// TODO Auto-generated method stub

		LinkedList<LinkedList<String>> routeLists=new LinkedList<LinkedList<String>>();
		List<String> routeList=new ArrayList<String>();
		Graph graph = new Graph();
		for(FlightDetailsModel obj:flights){
			graph.addEdge(obj.getFromLocation(), obj.getToLocation());
		}


		LinkedList<String> visited = new LinkedList();
		visited.add(src);
		new Search().depthFirst(graph, visited,dest,routeList);


		LinkedList<String> temp=new LinkedList<String>();

		for(String str:routeList){

			if(temp.isEmpty()){
				temp.add(str);
			}
			else{
				if(str.equals(dest)){
					temp.add(str);
					routeLists.add(temp);
					temp=new LinkedList<String>();
				}
				else {
					temp.add(str);
				}
			}

		}


		return routeLists;
	}

	private void depthFirst(Graph graph, LinkedList<String> visited,String dest,List<String> routeList) {
		LinkedList<String> nodes = graph.adjacentNodes(visited.getLast());
		for (String node : nodes) {
			if (visited.contains(node)) {
				continue;
			}
			if (node.equals(dest)) {
				visited.add(node);
				printPath(visited,routeList);
				visited.removeLast();
				break;
			}
		}
		for (String node : nodes) {
			if (visited.contains(node) || node.equals(dest)) {
				continue;
			}
			visited.addLast(node);
			depthFirst(graph, visited,dest,routeList);
			visited.removeLast();
		}
	}



	private void printPath(LinkedList<String> visited,List<String> routeList) {
		for (String node : visited) {
			routeList.add(node);
		}
	}
}


