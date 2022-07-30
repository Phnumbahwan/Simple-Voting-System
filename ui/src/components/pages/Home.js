import { useState } from 'react'
import { NomineeContainer } from '../NomineeContainer'
import VoteFinish from '../VoteFinish';

const Home = () => {
    const [finishVoting, setFinishVoting] = useState(false);

    return (
        <div className='mt-5'>
            {
                finishVoting ?
                    <VoteFinish />
                    :
                    <NomineeContainer setFinishVoting={setFinishVoting} />
            }
        </div>
    )
}

export default Home