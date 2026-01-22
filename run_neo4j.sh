#!/bin/bash

# Script to run Neo4j in Docker for Graph Analysis

echo "Starting Neo4j in Docker..."
echo "================================="
echo ""
echo "To start Neo4j, run:"
echo "docker run -d --name neo4j-graph \\"
echo "  -p 7474:7474 -p 7687:7687 \\"
echo "  -e NEO4J_AUTH=neo4j/password123 \\"
echo "  neo4j:latest"
echo ""
echo "To stop Neo4j:"
echo "docker stop neo4j-graph"
echo ""
echo "To remove container:"
echo "docker rm neo4j-graph"
echo ""
echo "Access Neo4j Browser at: http://localhost:7474"
echo "Username: neo4j"
echo "Password: password123"
echo "================================="