import {InferIdType} from "mongodb";

interface UserModelProps {
    id?: InferIdType<Document>
    name:string
    email:string
    password:string
    role:string
}

export class UserModel implements UserModelProps{
    id?: InferIdType<Document>;
    name:string;
    email:string
    password:string
    role:string

    constructor(props: UserModelProps) {
        this.id = props.id;
        this.name = props.name;
        this.email = props.email;
        this.password = props.password;
        this.role = props.role;
    }
}
