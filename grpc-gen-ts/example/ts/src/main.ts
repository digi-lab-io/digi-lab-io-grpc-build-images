import {NestFactory} from '@nestjs/core';
import {MicroserviceOptions, Transport} from '@nestjs/microservices';
import {join} from 'path';
import {AppModule} from './app.module';


async function bootstrap() {
    const app = await NestFactory.createMicroservice<MicroserviceOptions>(AppModule, {
        transport: Transport.GRPC,
        options: {
            url: '0.0.0.0:50051',
            package: 'book',
            protoPath: join(__dirname, '../../proto/book.proto'),
            loader: {
                longs: Number,
            },
        },
    });
    await app.listen();
}

bootstrap();
