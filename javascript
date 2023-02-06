import React, { useState } from "react";
import { Form, Button } from "react-bootstrap";

function CreateEnvironmentForm() {
  const [baseImage, setBaseImage] = useState("");
  const [packages, setPackages] = useState("");
  const [cpuRequests, setCpuRequests] = useState("");
  const [memoryRequests, setMemoryRequests] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    // Your code to submit the form and create the development environment
  };

  return (
    <Form onSubmit={handleSubmit}>
      <Form.Group controlId="formBaseImage">
        <Form.Label>Base Image</Form.Label>
        <Form.Control
          type="text"
          value={baseImage}
          onChange={(e) => setBaseImage(e.target.value)}
        />
      </Form.Group>

      <Form.Group controlId="formPackages">
        <Form.Label>Packages</Form.Label>
        <Form.Control
          type="text"
          value={packages}
          onChange={(e) => setPackages(e.target.value)}
        />
      </Form.Group>

      <Form.Group controlId="formCpuRequests">
        <Form.Label>CPU Requests</Form.Label>
        <Form.Control
          type="text"
          value={cpuRequests}
          onChange={(e) => setCpuRequests(e.target.value)}
        />
      </Form.Group>

      <Form.Group controlId="formMemoryRequests">
        <Form.Label>Memory Requests</Form.Label>
        <Form.Control
          type="text"
          value={memoryRequests}
          onChange={(e) => setMemoryRequests(e.target.value)}
        />
      </Form.Group>

      <Button variant="primary" type="submit">
        Create Environment
      </Button>
    </Form>
  );
}

export default CreateEnvironmentForm;
