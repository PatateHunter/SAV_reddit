import {InferIdType} from "mongodb";

interface ResponseModelProps {
    id?: InferIdType<Document>;
    name: string;
    user: string;
    dateHourAdd?: Date;
    content:string
    responses:ResponseModelProps[]
}

export class ResponseModel implements ResponseModelProps{
    id?: InferIdType<Document>;
    name: string;
    user: string;
    dateHourAdd?: Date;
    content:string;
    responses:ResponseModelProps[]


    constructor(props: ResponseModel) {
        this.id = props.id;
        this.name = props.name;
        this.user = props.user;
        this.dateHourAdd = props.dateHourAdd;
        this.content = props.content
        this.responses = props.responses;
    }
}
