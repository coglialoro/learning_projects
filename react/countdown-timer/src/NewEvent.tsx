import React from "react";
import { useForm } from "react-hook-form";
import { CDEvent } from "./CDEvent";

interface NewEventProps {
    addEvent: (event: CDEvent) => void;
}

interface FormValues {
    name: string;
    date: Date;
}

const defaultValues = {
    name: "",
    date: new Date(),
};

const NewEvent: React.VFC<NewEventProps> = ({ addEvent }) => {
    const {
        register,
        handleSubmit,
        formState: { errors },
        reset,
    } = useForm<FormValues>({ defaultValues });

    const onSubmit = (data: FormValues) => {
        addEvent({ name: data.name, date: data.date });
        reset({ date: new Date() });
    };

    return (
        <form className="new-event" onSubmit={handleSubmit(onSubmit)}>
            <input
                {...register("name", { required: true })}
                placeholder="Event name"
            />
            {errors.name && <span>Name field is required</span>}
            <input
                type="datetime-local"
                {...register("date", { required: true, valueAsDate: true })}
            />
            {errors.date && <span>Date field is required</span>}
            <input type="submit" />
        </form>
    );
};

export default NewEvent;
