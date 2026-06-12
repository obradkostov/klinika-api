import { Module } from '@nestjs/common';
import { PrismaModule } from 'src/prisma/prisma.module';
import { DoctorsService } from './doctors.service';
import { DoctorsController } from './doctors.controller';

@Module({
    imports:[PrismaModule],
    providers:[DoctorsService],
    controllers:[DoctorsController],
    exports:[DoctorsService]
})
export class DoctorsModule {}
