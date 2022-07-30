import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Modal from 'react-bootstrap/Modal';
import axios from '../api/axios';

const ModalForm = ({ showModal, nominated, setFinishVoting }) => {
    const [show, setShow] = useState(showModal);
    const [lastName, setLastName] = useState('');
    const [firstName, setFirstName] = useState('');
    const [age, setAge] = useState('');
    const [occupation, setOccupation] = useState('');
    const [completeAddress, setCompleteAddress] = useState('');

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [errors, setErrors] = useState({});

    const submitInformation = async () => {
        try {
            const responseForVoter = await axios.post('/voters',
                JSON.stringify({
                    lastName : lastName.charAt(0).toUpperCase() + lastName.slice(1),
                    firstName : firstName.charAt(0).toUpperCase() + firstName.slice(1),
                    age,
                    occupation : occupation.charAt(0).toUpperCase() + occupation.slice(1),
                    completeAddress : completeAddress.toUpperCase()
                }),
                {
                    headers:
                    {
                        'Content-Type': 'application/json',
                    },
                },
            )
            console.log(nominated);
            const responseForNomineeVote = await axios.post('/nominee-vote',
                JSON.stringify({
                    voter_id: responseForVoter.data.id,
                    president_id: nominated[0].id,
                    vice_president_id: nominated[1].id,
                    treasurer_id: nominated[2].id,
                }),
                {
                    headers:
                    {
                        'Content-Type': 'application/json',
                    },
                },
            )
            setLastName('');
            setFirstName('');
            setAge('');
            setOccupation('');
            setCompleteAddress('');
            setFinishVoting(true);
        } catch (e) {
            console.log(e);
            setErrors(e.response.data.errors);
        }

    }

    return (
        <>
            <Button className='mt-4 px-5' variant="success" onClick={handleShow}>
                ALL GOOD!
            </Button>

            <Modal show={show} onHide={handleClose}>
                <Modal.Header closeButton>
                    <Modal.Title>Voter's Information</Modal.Title>
                </Modal.Header>
                <Modal.Body className="py-3">
                    <Form>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Last name</Form.Label>
                            <Form.Control
                                className={errors.lastName && 'error'}
                                value={lastName}
                                onChange={(e) => setLastName(e.target.value)}
                                type="text"
                                autoFocus
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>First name</Form.Label>
                            <Form.Control
                                className={errors.firstName && 'error'}
                                value={firstName}
                                onChange={(e) => setFirstName(e.target.value)}
                                type="text"
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Age</Form.Label>
                            <Form.Control
                                className={errors.age && 'error'}
                                value={age}
                                onChange={(e) => setAge(e.target.value)}
                                type="number"
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Occupation</Form.Label>
                            <Form.Control
                                className={errors.occupation && 'error'}
                                value={occupation}
                                onChange={(e) => setOccupation(e.target.value)}
                                type="text"
                                required
                            />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                            <Form.Label>Complete Address</Form.Label>
                            <Form.Control
                                className={errors.completeAddress && 'error'}
                                value={completeAddress}
                                onChange={(e) => setCompleteAddress(e.target.value)}
                                type="text"
                                required
                            />
                        </Form.Group>
                    </Form>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Close
                    </Button>
                    <Button variant="primary" onClick={submitInformation}>
                        Save Changes
                    </Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}

export default ModalForm