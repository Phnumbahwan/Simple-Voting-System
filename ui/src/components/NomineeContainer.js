import React, { useEffect, useState } from 'react'
import { Button, Card } from 'react-bootstrap';
import axios from '../api/axios';
import ModalForm from './ModalForm';

export const NomineeContainer = ({ setFinishVoting }) => {
    const [nominee, setNominee] = useState([])
    const [currentVotePage, setCurrentVotePage] = useState(0);
    const [confirmVote, setConfirmVote] = useState(false);
    const [nominated, setNominated] = useState([]);
    const [change, setChange] = useState(false);

    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    let categories = [
        'President',
        'Vice President',
        'Treasurer',
    ]

    const nextPage = (nominee) => {
        if (change) {
            if (nominee.category == 'President') {
                nominated[0] = nominee;
            } else if (nominee.category == 'Vice President') {
                nominated[1] = nominee;
            } else if (nominee.category == 'Treasurer') {
                nominated[2] = nominee;
            }
            console.log(nominated);
            setConfirmVote(true);
        } else {
            setCurrentVotePage(currentVotePage + 1);
            console.log(nominee.name);
            setNominated([...nominated, nominee]);

            if (currentVotePage == categories.length - 1) {
                setConfirmVote(true);
                console.log("DONE");
            }
        }
    }

    const changeVote = (category) => {
        setConfirmVote(false);
        if (category == 'President') {
            setCurrentVotePage(0);
        } else if (category == 'Vice President') {
            setCurrentVotePage(1);
        } else if (category == 'Treasurer') {
            setCurrentVotePage(2);
        }
        setChange(true);
    }

    useEffect(() => {
        const getNominee = async () => {
            try {
                const response = await axios.get('/nominee');
                const newNominee = response.data.filter((d) => d.category == categories[currentVotePage]);
                setNominee(newNominee);
            } catch (e) {
                console.log(e);
            }
        }
        getNominee();
    }, [currentVotePage])

    return (
        <>
            {
                confirmVote ?
                    <div>
                        <div className='border-bottom-cat mb-3'>
                            <h3>PLEASE CONFIRM YOUR VOTE</h3>
                        </div>
                        <div className='row justify-content-md-center'>
                            {
                                nominated.map((n, index) =>
                                    <Card key={index} style={{ width: '18rem', margin: '10px' }}>
                                        <Card.Img variant="top" src={require('../uploads/' + n.image)} />
                                        <Card.Body>
                                            <Card.Title>{n.name}</Card.Title>
                                            <Card.Text>
                                                {n.category}
                                            </Card.Text>
                                            <Button onClick={() => changeVote(n.category)} variant="primary">Change</Button>
                                        </Card.Body>
                                    </Card>
                                )
                            }
                        </div>
                        <ModalForm nominated={nominated} setFinishVoting={setFinishVoting} />
                    </div>
                    :
                    <div>
                        <div className='border-bottom-cat mb-3'>
                            <h3>WHO IS YOUR {categories[currentVotePage]?.toUpperCase()}</h3>
                        </div>
                        <div className='row justify-content-md-center'>
                            {
                                nominee.map((n, index) =>
                                    <Card key={index} style={{ width: '18rem', margin: '10px' }}>
                                        <Card.Img variant="top" src={require('../uploads/' + n.image)} />
                                        <Card.Body>
                                            <Card.Title>{n.name}</Card.Title>
                                            <p>{n.category}</p>
                                            <Card.Text className='row'>
                                                <span>{n.description}</span>
                                            </Card.Text>
                                            <Button onClick={() => nextPage(n)} variant="primary">Vote</Button>
                                        </Card.Body>
                                    </Card>
                                )
                            }
                        </div>
                    </div>
            }
        </>
    )
}
